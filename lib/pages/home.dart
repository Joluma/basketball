import 'package:flutter/material.dart';

import 'package:jojo_basketball/components/scores-tab.dart';
import 'package:jojo_basketball/components/calendar_strip.dart';

class NbaScoresHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NBA Scores"),
      ),
      body: NbaScoresHomeBody(),
    );
  }
}

class NbaScoresHomeBody extends StatefulWidget {
  @override
  NbaScoresHomeBodyState createState() => NbaScoresHomeBodyState();
}

class NbaScoresHomeBodyState extends State<NbaScoresHomeBody> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime endDate = DateTime.now().add(Duration(days: 30));

  String _selectedDate = DateTime.now().toString().split(' ')[0];

  onSelect(date) {
    setState(() {
      _selectedDate = date.toString().split(' ')[0];
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: CalendarStrip(
          addSwipeGesture: true,
          startDate: startDate,
          endDate: endDate,
          selectedDate: DateTime.now(),
          onDateSelected: onSelect,
          containerDecoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 1),
                blurRadius: 10,
              ),
            ],
          ),
        )),
        Expanded(child: NbaScoresTab(key: UniqueKey(), date: _selectedDate)),
      ],
    );
  }
}
