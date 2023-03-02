import 'package:flutter/material.dart';

import 'Go_Router/app_route_config.dart';

void main() {
  // TODO: implement main
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///For Go Router
    return MaterialApp.router(
      // routeInformationParser:
      //     NyAppRouter.returnRouter(false).routeInformationParser,
      // routerDelegate: NyAppRouter.returnRouter(false).routerDelegate,
      routerConfig: NyAppRouter.returnRouter(false),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );

    ///For Route Observer
    // return MaterialApp(
    //   theme: ThemeData(
    //     useMaterial3: true,
    //   ),
    //   navigatorObservers: [routeObserver],
    //   home: const Screen1(),
    //   routes: {
    //     'screen2': (context) => const Screen2(),
    //     'screen3': (context) => const Screen3(),
    //   },
    // );
  }
}
