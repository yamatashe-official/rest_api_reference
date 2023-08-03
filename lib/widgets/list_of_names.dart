import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../hooks/search_list.dart';
import '../models/CharacterModel.dart';
import '../pages/detail_of_person_page.dart';
import '../providers/data_provider.dart';
import '../providers/flavor_provider.dart';

class ListOfNames extends StatefulWidget {
  const ListOfNames({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<ListOfNames> createState() => _ListOfNamesState();
}

class _ListOfNamesState extends State<ListOfNames> {
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  List<CharacterModel> listOfSearchedPeople = [];

  final double switchWidth = 700;

  clearSearch() {
    setState(() {
      searchController.clear();
      listOfSearchedPeople = [];
    });
  }

  listTileOnTap({required int index, required DataProvider dp}) {
    FocusScope.of(context).unfocus();
    if (listOfSearchedPeople.isNotEmpty) {
      dp.updateSelectedCharacter = listOfSearchedPeople[index];
    } else {
      dp.updateSelectedCharacter = dp.characters[index];
    }

    if (widget.size.width < switchWidth) Navigator.pushNamed(context, DetailOfPersonPage.routeName);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.position.isScrollingNotifier.addListener(() {
        FocusScope.of(context).unfocus();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width > switchWidth ? widget.size.width * 0.5 : widget.size.width,
      child: Consumer<DataProvider>(
        builder: (context, dp, child) => CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Consumer<FlavorProvider>(
                builder: (context, fp, child) => Text(fp.flavorConfig?.appTitle ?? "No Title Provided"),
              ),
              floating: true,
              pinned: true,
              stretch: true,
              collapsedHeight: 120,
              expandedHeight: 120,
              leading: IconButton(
                onPressed: () {
                  clearSearch();
                  context.read<DataProvider>().updateSelectedCharacter = null;
                },
                icon: const Icon(Icons.clear),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                  child: TextField(
                    controller: searchController,
                    onChanged: (_) => setState(() => listOfSearchedPeople = searchList(dp: dp, searchController: searchController)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () => clearSearch(),
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                  children: [
                    ListTile(
                        title: Center(
                            child: Text(listOfSearchedPeople.isNotEmpty
                                ? listOfSearchedPeople[index].Name ?? "No Name Provided"
                                : dp.characters[index].Name ?? "No Name Provided")),
                        onTap: () => listTileOnTap(index: index, dp: dp)),
                    const Divider(color: Colors.black12),
                  ],
                ),
                childCount: listOfSearchedPeople.isNotEmpty ? listOfSearchedPeople.length : dp.characters.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
