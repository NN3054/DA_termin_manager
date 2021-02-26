import 'package:flutter/material.dart';
import 'package:align_positioned/align_positioned.dart';

import './buttons/DateButton.dart';
import './buttons/PlusButton.dart';
import './buttons/SwitchViewDaily.dart';
import './buttons/SwitchViewWeekly.dart';

class MenuBar extends StatelessWidget {
  final String _dateKW = '01.01.2020 \n KW 1';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          DateButton(),
          PlusButton(),
          SwitchViewDaily(),
          SwitchViewWeekly(),
        ],
      ),
    );
  }
}
