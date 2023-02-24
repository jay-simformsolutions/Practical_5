import 'package:flutter/material.dart';

class HeroPage2 extends StatelessWidget {
  const HeroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation Page2'),
      ),
      body: Hero(
        tag: 'Hero',
        child: const Center(
          child: Icon(
            Icons.add,
            size: 200,
          ),
        ),
        flightShuttleBuilder: (flightContext, animation, flightDirection,
            fromHeroContext, toHeroContext) {
          if (flightDirection == HeroFlightDirection.push) {
            return const Icon(Icons.push_pin);
          } else {
            return const Icon(Icons.remove);
          }
        },
        transitionOnUserGestures: true,
        placeholderBuilder: (context, heroSize, child) {
          return Center(
            child: Container(
              height: 300,
              width: 300,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
