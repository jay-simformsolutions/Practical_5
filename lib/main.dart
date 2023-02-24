import 'package:flutter/material.dart';
import 'package:practical_5/Hero/page1.dart';

void main() {
  // TODO: implement main
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HeroPage1(),
      //debugShowCheckedModeBanner: false,
    );
  }
}
