import 'package:flutter/cupertino.dart';

class ScoreCardTeam extends StatelessWidget {
  ScoreCardTeam(this.team);

  final team;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Image.network(
          team['logo'],
          width: 64,
        ),
      ),
      Text(team['name'], textAlign: TextAlign.center),
    ]);
  }
}
