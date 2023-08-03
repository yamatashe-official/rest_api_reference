import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../flavors_config.dart';
import '../hooks/reach_for_data.dart';
import '../providers/data_provider.dart';
import '../providers/flavor_provider.dart';
import '../widgets/character_detail.dart';
import '../widgets/list_of_names.dart';

class ListOfPeoplePage extends StatefulWidget {
  const ListOfPeoplePage({
    super.key,
    this.flavorsConfig,
  });
  static const routeName = "/list-of-people";
  final FlavorsConfig? flavorsConfig;

  @override
  State<ListOfPeoplePage> createState() => _ListOfPeoplePageState();
}

class _ListOfPeoplePageState extends State<ListOfPeoplePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FlavorProvider>().updateFlavor = widget.flavorsConfig;
      reachForData(dp: context.read<DataProvider>(), fc: context.read<FlavorProvider>().flavorConfig!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Consumer<DataProvider>(
          builder: (context, dp, child) => Row(
            children: [
              ListOfNames(size: size),
              CharacterDetail(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
