import 'package:flutter/material.dart';
import 'package:jojo_basketball/components/score-card/score-card-team.dart';

class Game extends StatelessWidget {
  Game(this.item);

  final item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NBA Scores"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Text(item['teams']['away']['name']),
                Expanded(child: ScoreCardTeam(item['teams']['away'])),
                Text(item['teams']['home']['name']),
                Expanded(child: ScoreCardTeam(item['teams']['home'])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
