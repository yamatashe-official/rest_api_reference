import 'flavors_config.dart';
import 'main_common.dart';

void main() {
  final simpsonViewerConfig = FlavorsConfig(
    appTitle: "Simpson Viewer",
    apiEndpoints: {"apiDataRepo": "http://api.duckduckgo.com/?q=simpsons+characters&format=json"},
    imageLocation: null,
    themeData: null,
  );

  mainCommon(simpsonViewerConfig);
}
