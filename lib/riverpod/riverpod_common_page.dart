import 'package:flutter/material.dart';
import 'package:practical_5/riverpod/future_riverpod_example.dart';
import 'package:practical_5/riverpod/riverpod_counter.dart';

class RiverPodCommonPage extends StatelessWidget {
  const RiverPodCommonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const RiverPodCounterExample()));
                },
                child: const Text('StateNotifier Example')),
            ElevatedButton(
                onPressed: () {},
                child: const Text('StateNotifierProvider Example')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const FutureRiverPodExample()));
              },
              child: const Text('FutureProvider Example'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('StreamProvider Example'),
            ),
          ],
        ),
      ),
    );
  }
}
