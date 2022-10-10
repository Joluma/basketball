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
            if (item['status']['short'] == 'FT') ...[
              Expanded(
                child: ScoreCardPoints(
                  item['scores']['away']['total'],
                  item['scores']['away']['total'] >
                      item['scores']['home']['total'],
                ),
              ),
            ],
            Expanded(
              child: ScoreCardDate(item['date'], item['status']),
              flex: item['status']['short'] == 'FT' ? 1 : 3,
            ),
            if (item['status']['short'] == 'FT') ...[
              Expanded(
                child: ScoreCardPoints(
                  item['scores']['home']['total'],
                  item['scores']['home']['total'] >
                      item['scores']['away']['total'],
                ),
              ),
            ],
            Expanded(child: ScoreCardTeam(item['teams']['home'])),
          ],
        ),
      ),
    );
  }
}
