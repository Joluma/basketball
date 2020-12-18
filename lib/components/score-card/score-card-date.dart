import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScoreCardDate extends StatelessWidget {
  ScoreCardDate(this.date, this.status);

  final String date;
  final status;

  @override
  Widget build(BuildContext context) {
    final String gameTime = DateFormat.jm().format(DateTime.parse(date));
    final gameStatus = status['short'] == 'FT'
      ? 'Ended'
      : gameTime.toString();

    return Text(
      gameStatus,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black54,
      ),
    );
  }
}
