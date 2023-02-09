import 'package:flutter/material.dart';
import 'package:practical_5/AdvancedWidget/alert_dialogbox.dart';
import 'package:practical_5/AdvancedWidget/checkbox.dart';
import 'package:practical_5/AdvancedWidget/exapnsion_panel_list.dart';
import 'package:practical_5/AdvancedWidget/grid_view.dart';
import 'package:practical_5/AdvancedWidget/list_view.dart';
import 'package:practical_5/AdvancedWidget/radio_widget.dart';
import 'package:practical_5/AdvancedWidget/silverAppBar_widget.dart';
import 'package:practical_5/AdvancedWidget/simple_dialog.dart';
import 'package:practical_5/AdvancedWidget/switch_widget.dart';
import 'package:practical_5/AdvancedWidget/tab_bar.dart';
import 'package:practical_5/AdvancedWidget/tab_page_selector.dart';
import 'package:practical_5/CupertinoWidgets/cupertino_action_sheet.dart';

import 'AdvancedWidget/bottom_sheet.dart';
import 'AdvancedWidget/card.dart';
import 'AdvancedWidget/chip_widget.dart';
import 'AdvancedWidget/drawer_widget.dart';

void main() {
  // TODO: implement main
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CupertinoActionsheetWidget(),
      debugShowCheckedModeBanner: false,

    );
  }
}
