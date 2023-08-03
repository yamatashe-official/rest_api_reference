import 'package:flutter/material.dart';

class FlavorsConfig {
  String? appTitle;
  Map<String, String>? apiEndpoints;
  String? imageLocation;
  ThemeData? themeData;

  FlavorsConfig({
    required this.appTitle,
    required this.apiEndpoints,
    required this.imageLocation,
    required this.themeData,
  });
}
