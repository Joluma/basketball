import 'package:flutter/cupertino.dart';

class ScoreCardTeam extends StatelessWidget {
  ScoreCardTeam(this.team);

  final team;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Hero(
          tag: 'hero-${team['id']}-logo',
          child: Image.asset(
            'team-logos/${team['id']}.png',
            width: 64,
          ),
        ),
      ),
      Text(
        team['name'],
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
