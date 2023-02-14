import 'package:flutter/material.dart';
import 'package:practical_5/AdvancedWidget/wrap_widget.dart';

void main() {
  // TODO: implement main
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WrapWidget(),
      //debugShowCheckedModeBanner: false,
    );
  }
}
