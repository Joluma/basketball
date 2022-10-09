import 'package:flutter/cupertino.dart';

class ScoreCardQuarter extends StatelessWidget {
  ScoreCardQuarter(this.quarterNumber, this.scoreAway, this.scoreHome);

  final String quarterNumber;
  final int scoreAway;
  final int scoreHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              scoreAway.toString(),
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Text(
              quarterNumber,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          // flex: 1,
          Expanded(
            child: Text(
              scoreHome.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
