import 'package:flutter/material.dart';

import 'templates/time_container_pattern.dart';

class Time extends StatelessWidget {
  // variables for the width und heigth of a container
  final double _timeContWidth = 65;
  final double _timeContHeigth = 30;

  @override
  Widget build(BuildContext context) {
    return Container(

      //space to the left side
      margin: EdgeInsets.only(left: 2),

      alignment: Alignment.topLeft,

      //Time Row/Column on the left side
      //Used Row to place it on the left side as CrossAxisAlignment.start does not work

      child:
        Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TimeContainerPattern('07:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('07:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('08:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('08:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('09:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('09:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('10:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('10:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('11:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('11:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('12:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('12:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('13:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('13:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('14:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('14:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('15:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('15:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('16:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('16:30', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('17:00', _timeContWidth, _timeContHeigth),
              TimeContainerPattern('17:30', _timeContWidth, _timeContHeigth),
            ],
        ),
    );
  }
}