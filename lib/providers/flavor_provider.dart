import 'package:flutter/material.dart';

import '../flavors_config.dart';

class FlavorProvider with ChangeNotifier {
  FlavorsConfig? flavorConfig;

  set updateFlavor(FlavorsConfig? newFlavorConfig) {
    flavorConfig = newFlavorConfig;
    notifyListeners();
  }
}
