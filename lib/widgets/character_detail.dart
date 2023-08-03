import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({
    super.key,
    required this.size,
    this.overrideDynamicSizing,
    this.showExitButton,
  });

  final Size size;
  final bool? overrideDynamicSizing;
  final bool? showExitButton;

  final TextStyle titleStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final TextStyle descStyle = const TextStyle(fontSize: 14);

  final double switchWidth = 700;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: overrideDynamicSizing ?? size.width > switchWidth,
      child: SizedBox(
        width: overrideDynamicSizing == true
            ? size.width
            : size.width > switchWidth
                ? size.width * 0.5
                : size.width,
        child: Center(
          child: Consumer<DataProvider>(
            builder: (context, dp, child) => dp.selectedCharacter != null
                ? CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        title: size.width < switchWidth ? const Text("Character Details") : const Center(child: Text('Character Detail')),
                        floating: true,
                        pinned: true,
                        stretch: true,
                        expandedHeight: size.width < switchWidth ? 60 : 120,
                        collapsedHeight: size.width < switchWidth ? 60 : 120,
                        leading: showExitButton == true
                            ? IconButton(
                                onPressed: () {
                                  context.read<DataProvider>().updateSelectedCharacter = null;
                                  if (size.width < switchWidth) {
                                    Navigator.pop(context);
                                  }
                                },
                                icon: const Icon(Icons.clear))
                            : null,
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                            padding: const EdgeInsets.all(60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dp.selectedCharacter?.Name ?? "No Name Provided", style: titleStyle),
                                Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    child: Text(dp.selectedCharacter?.Description ?? "No Description Provided", style: descStyle)),
                                Image.network(
                                  dp.selectedCharacter?.ImageUrl ?? "https://placehold.co/600x400/png",
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                : null),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          childCount: 1,
                        ),
                      )
                    ],
                  )
                : const Text("Select a character from the list on the left"),
          ),
        ),
      ),
    );
  }
}
