import 'package:flutter/material.dart';

import 'package:jojo_basketball/components/scores-tab.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

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
  DatePickerController _controller = DatePickerController();
  String _selectedDate = DateTime.now().toString().split(' ')[0];

  void executeAfterBuild() {
    _controller.animateToDate(DateTime.now().subtract(Duration(days: 3)));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => executeAfterBuild());

    return Column(
      children: <Widget>[
        Container(
          child: DatePicker(
            DateTime.now().subtract(Duration(days: 100)),
            width: 60,
            height: 80,
            controller: _controller,
            initialSelectedDate: DateTime.now(),
            selectionColor: Color.fromARGB(255, 94, 88, 88),
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              setState(() {
                _selectedDate = date.toString().split(' ')[0];
              });
            },
          ),
        ),
        Expanded(
          child: NbaScoresTab(key: UniqueKey(), date: _selectedDate),
        ),
      ],
    );
  }
}
