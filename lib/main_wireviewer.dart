import 'flavors_config.dart';
import 'main_common.dart';

void main() {
  final wireViewerConfig = FlavorsConfig(
    appTitle: "Wire Viewer",
    apiEndpoints: {"apiDataRepo": "http://api.duckduckgo.com/?q=the+wire+characters&format=json"},
    imageLocation: null,
    themeData: null,
  );

  mainCommon(wireViewerConfig);
}
