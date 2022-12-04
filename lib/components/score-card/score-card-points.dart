import 'package:flutter/material.dart';

class ScoreCardPoints extends StatelessWidget {
  ScoreCardPoints(this.points, this.isWinner);

  final int points;
  final bool isWinner;

  @override
  Widget build(BuildContext context) {
    return Text(
      points.toString(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: isWinner ? FontWeight.w700 : FontWeight.w300,
        color: isWinner ? Colors.black : Colors.black54,
      ),
    );
  }
}
