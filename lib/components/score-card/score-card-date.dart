import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScoreCardDate extends StatelessWidget {
  ScoreCardDate(this.date, this.status);

  final String date;
  final status;

  @override
  Widget build(BuildContext context) {
    final String gameTime = DateFormat.jm().format(DateTime.parse(date));
    final gameStatus =
        status['short'] == 'NS' ? gameTime.toString() : status['short'];

    return Text(
      gameStatus,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: status['short'] == 'NS' ? 24 : 18,
        color: status['short'] == 'NS' ? Colors.black54 : Colors.black,
        fontWeight:
            status['short'] == 'NS' ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
