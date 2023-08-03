import 'package:flutter/material.dart';
import '../widgets/character_detail.dart';

class DetailOfPersonPage extends StatefulWidget {
  const DetailOfPersonPage({super.key});
  static const routeName = "/detail-of-person";

  @override
  State<DetailOfPersonPage> createState() => _DetailOfPersonPageState();
}

class _DetailOfPersonPageState extends State<DetailOfPersonPage> {
  final double switchWidth = 700;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (constraints.maxWidth > switchWidth) {
            Navigator.pop(context);
          }
        });
        return CharacterDetail(
          size: size,
          overrideDynamicSizing: size.width > switchWidth ? false : true,
          showExitButton: size.width > switchWidth ? false : true,
        );
      }),
    );
  }
}
