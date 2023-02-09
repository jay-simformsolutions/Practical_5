import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoListTileWidget extends StatelessWidget {
  const CupertinoListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CUPERTINO LISTTILE WIDGET"),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: Center(
        child: CupertinoListSection(
          backgroundColor: Colors.black12,
          children: [
            CupertinoListTile(
              //backgroundColor: Colors.tealAccent,
              title: const Text("This is ListTile"),
              trailing: const CupertinoListTileChevron(),
              leading: Container(
                height: 25,
                color: Colors.teal,
              ),
              additionalInfo: const Text("Additional"),
            ),
        const SizedBox(height: 5),
        CupertinoListTile(
          title: const Text('Push to master'),
          leading: Container(
            width: double.infinity,
            height: double.infinity,
            color: CupertinoColors.systemRed,
          ),
          additionalInfo: const Text('Not available'),
        ),
        CupertinoListTile(
          title: const Text('View last commit'),
          leading: Container(
            width: double.infinity,
            height: double.infinity,
            color: CupertinoColors.activeOrange,
          ),
          additionalInfo: const Text('12 days ago'),
          trailing: const CupertinoListTileChevron(),
          onTap: () {}
            ),
          ],
        ),
      ),
    );
  }
}
