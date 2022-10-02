import 'package:flutter/material.dart';
import 'package:jojo_basketball/components/score-card/score-card.dart';
import 'dart:async';

import 'package:jojo_basketball/services/data-fetcher.dart';

class NbaScoresTab extends StatefulWidget {
  NbaScoresTab({
    Key key,
    @required this.date,
  }) : super(key: key);

  final String date;

  @override
  NbaScoresTabState createState() => NbaScoresTabState(date);
}

class NbaScoresTabState extends State<NbaScoresTab> {
  NbaScoresTabState(this.date);

  final String date;
  Future<List> data;

  @override
  void initState() {
    super.initState();
    data = fetchJSONData(this.date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.length == 0
                ? Center(
                    child: Text(
                      'No games this day',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ScoreCard(snapshot.data[index]);
                    },
                  );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
                style: TextStyle(fontSize: 24.0),
              ),
            );
          }

          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
