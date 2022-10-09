import 'package:flutter/material.dart';
import 'package:jojo_basketball/pages/game.dart';
import 'package:jojo_basketball/components/score-card/score-card.dart';

class ScoreListItem extends StatelessWidget {
  ScoreListItem(this.item);

  final item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Game(item);
            },
          ),
        );
      },
      child: ScoreCard(item),
    );
  }
}
