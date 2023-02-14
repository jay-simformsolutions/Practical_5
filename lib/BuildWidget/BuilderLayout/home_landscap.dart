import 'package:flutter/material.dart';

import 'home_card_widget.dart';

class HomeLandscapeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Expanded(
                child: HomeCardWidget(cardText: "Card 1"),
              ),
              Expanded(
                child: HomeCardWidget(
                  cardText: "Card 2",
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Expanded(
                child: HomeCardWidget(
                  cardText: "Card 3",
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: HomeCardWidget(
                  cardText: "Card 4",
                ),
              ),
              Expanded(
                child: HomeCardWidget(
                  cardText: "Card 5",
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  NetworkImage(
                      "https://blog.logrocket.com/wp-content/uploads/2021/06/flutter-futurebuild-.png"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
