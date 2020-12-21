import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jojo_basketball/components/scores-tab.dart';
import 'package:jojo_basketball/components/calendar_strip.dart';

class NbaScoresHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jojo Basketball Scores"),
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

  DateTime _selectedDate = DateTime.now();

  onSelect(date) {
    setState(() {
      _selectedDate = date;
    });
  }

  onWeekSelect(firstDayOfWeek) {
    setState(() {
      _selectedDate = firstDayOfWeek;
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
          selectedDate: _selectedDate,
          onDateSelected: onSelect,
          onWeekSelected: onWeekSelect,
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
        Expanded(child: NbaScoresTab(key: UniqueKey(), date: _selectedDate.toString().split(' ')[0])),
      ],
    );
  }
}
