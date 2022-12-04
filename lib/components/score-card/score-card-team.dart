import 'package:flutter/material.dart';

class ScoreCardTeam extends StatelessWidget {
  ScoreCardTeam(this.team, this.isAtHome);

  final team;
  final bool isAtHome;

  @override
  Widget build(BuildContext context) {
    return Row(
        textDirection: isAtHome ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Hero(
              tag: 'hero-${team['id']}-logo',
              child: Image.asset(
                'team-logos/${team['id']}.png',
                width: 64,
                height: 64,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            team['name'].substring(0, 3).toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ]);
  }
}
