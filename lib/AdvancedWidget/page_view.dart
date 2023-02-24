import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  PageController controller = PageController();
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PAGE VIEW "),
          centerTitle: true,
        ),
        body: PageView(
          allowImplicitScrolling: true,
          scrollDirection: Axis.vertical,
          controller: controller,
          scrollBehavior: MaterialScrollBehavior(),
          children: const [
            Center(
              child: Text("Page One"),
            ),
            Center(
              child: Text("Page 2"),
            ),
            Center(
              child: Text("Page 3"),
            ),
          ],
          onPageChanged: (value) {
            setState(() {
              print(value);
              _curr = value;
            });
          },
        ),
      ),
    );
  }
}
