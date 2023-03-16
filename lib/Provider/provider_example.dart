import 'package:flutter/material.dart';
import 'package:practical_5/Provider/counter_notifier.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Counter _countProvider = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PROVIDER EXAMPLE'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<Counter>(
              builder: (context, value, child) => Text(
                context.read<Counter>().count.toString(),
                // context.watch<Counter>().count.toString(),
                //value.count.toString()
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Increment called");
                    Provider.of<Counter>(context, listen: false)
                        .incrementCounter();
                  },
                  child: Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("decrement caleed");
                    Provider.of<Counter>(context, listen: false)
                        .decrementCounter();
                  },
                  child: Text('decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
