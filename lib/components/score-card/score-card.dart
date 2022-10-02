import 'package:flutter/material.dart';
import 'package:jojo_basketball/components/score-card/score-card-date.dart';
import 'package:jojo_basketball/components/score-card/score-card-points.dart';
import 'package:jojo_basketball/components/score-card/score-card-team.dart';

class ScoreCard extends StatelessWidget {
  ScoreCard(this.item);

  final item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(32),
          child: Row(
            children: <Widget>[
              Expanded(child: ScoreCardTeam(item['teams']['away'])),
              Expanded(
                  child: ScoreCardPoints(item['scores']['home']['total'] ?? 0,
                      item['scores']['away']['total'] ?? 0)),
              Expanded(child: ScoreCardDate(item['date'], item['status'])),
              Expanded(
                  child: ScoreCardPoints(item['scores']['away']['total'] ?? 0,
                      item['scores']['home']['total'] ?? 0)),
              Expanded(child: ScoreCardTeam(item['teams']['home'])),
            ],
          )),
    );
  }
}
