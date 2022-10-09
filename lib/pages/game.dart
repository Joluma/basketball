import 'package:flutter/material.dart';
import 'package:jojo_basketball/components/score-card/score-card.dart';
import 'package:jojo_basketball/components/score-card/score-quarter.dart';

class Game extends StatelessWidget {
  Game(this.item);

  final item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${item['teams']['away']['name']} @ ${item['teams']['home']['name']}"),
      ),
      body: Container(
        child: Column(
          children: [
            ScoreCard(item),
            Container(
              child: Column(
                children: [
                  ScoreCardQuarter(
                    '1',
                    item['scores']['away']['quarter_1'],
                    item['scores']['home']['quarter_1'],
                  ),
                  ScoreCardQuarter(
                    '2',
                    item['scores']['away']['quarter_2'],
                    item['scores']['home']['quarter_2'],
                  ),
                  ScoreCardQuarter(
                    '3',
                    item['scores']['away']['quarter_3'],
                    item['scores']['home']['quarter_3'],
                  ),
                  ScoreCardQuarter(
                    '4',
                    item['scores']['away']['quarter_4'],
                    item['scores']['home']['quarter_4'],
                  ),
                  if (item['scores']['away']['over_time'] != null) ...[
                    ScoreCardQuarter(
                      'OT',
                      item['scores']['away']['over_time'],
                      item['scores']['home']['over_time'],
                    ),
                  ],
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
