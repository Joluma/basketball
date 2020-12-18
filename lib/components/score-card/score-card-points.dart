import 'package:flutter/cupertino.dart';

class ScoreCardPoints extends StatelessWidget {
  ScoreCardPoints(this.teamTotal, this.opponentTotal);

  final int teamTotal;
  final int opponentTotal;

  @override
  Widget build(BuildContext context) {
    return Text(
      teamTotal > 0 ? teamTotal.toString() : '--',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: teamTotal > opponentTotal ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
