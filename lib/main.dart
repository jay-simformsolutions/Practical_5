import 'package:flutter/material.dart';
import 'package:practical_5/Provider/counter_notifier.dart';
import 'package:provider/provider.dart';

import 'Provider/provider_example.dart';

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
    // return MaterialApp.router(
    //   // routeInformationParser:
    //   //     NyAppRouter.returnRouter(false).routeInformationParser,
    //   // routerDelegate: NyAppRouter.returnRouter(false).routerDelegate,
    //   routerConfig: NyAppRouter.returnRouter(false),
    //   theme: ThemeData(
    //     useMaterial3: true,
    //   ),
    // );

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

    //For Provider
    /// Provider solve the problem related to InheritadeWidget and make
    /// functions and variable globally accessible and MaterialApp is remain
    /// throughout the App that's why we need ro wrap Provider with MaterialApp.
    print("Lazy is Called");
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      lazy: true,
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const ProviderExample(),
      ),
    );
  }
}
