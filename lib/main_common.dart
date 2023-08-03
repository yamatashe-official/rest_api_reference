import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'flavors_config.dart';
import 'pages/detail_of_person_page.dart';
import 'pages/list_of_people_page.dart';
import 'providers/data_provider.dart';
import 'providers/flavor_provider.dart';
import 'providers/screen_provider.dart';

void mainCommon(FlavorsConfig flavorConfig) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => DataProvider()),
        ChangeNotifierProvider(create: (ctx) => ScreenProvider()),
        ChangeNotifierProvider(create: (ctx) => FlavorProvider())
      ],
      child: MainApp(flavorsConfig: flavorConfig),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    this.flavorsConfig,
  });

  final FlavorsConfig? flavorsConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListOfPeoplePage(flavorsConfig: flavorsConfig),
      onGenerateRoute: _onGenerateRoute,
    );
  }

  static Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ListOfPeoplePage.routeName:
        return MaterialPageRoute(builder: (ctx) => const ListOfPeoplePage());
      case DetailOfPersonPage.routeName:
        return MaterialPageRoute(builder: (ctx) => const DetailOfPersonPage());
      default:
        return MaterialPageRoute(builder: (ctx) => const ListOfPeoplePage());
    }
  }
}
