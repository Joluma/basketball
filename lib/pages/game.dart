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
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 320,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'team-logos/${item['teams']['away']['id']}.png'),
                              fit: BoxFit.fitHeight,
                              opacity: 0.1,
                              alignment: Alignment(2, 0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 320,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'team-logos/${item['teams']['home']['id']}.png'),
                              fit: BoxFit.fitHeight,
                              opacity: 0.1,
                              alignment: Alignment(-2, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 48),
                    child: Column(
                      children: [
                        ScoreQuarter(
                          '1',
                          item['scores']['away']['quarter_1'],
                          item['scores']['home']['quarter_1'],
                        ),
                        ScoreQuarter(
                          '2',
                          item['scores']['away']['quarter_2'],
                          item['scores']['home']['quarter_2'],
                        ),
                        ScoreQuarter(
                          '3',
                          item['scores']['away']['quarter_3'],
                          item['scores']['home']['quarter_3'],
                        ),
                        ScoreQuarter(
                          '4',
                          item['scores']['away']['quarter_4'],
                          item['scores']['home']['quarter_4'],
                        ),
                        if (item['scores']['away']['over_time'] != null) ...[
                          ScoreQuarter(
                            'OT',
                            item['scores']['away']['over_time'],
                            item['scores']['home']['over_time'],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
