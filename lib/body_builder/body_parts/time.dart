import 'package:flutter/material.dart';

import 'templates/container_pattern.dart';

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
              ContainerPattern('07:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('07:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('08:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('08:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('09:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('09:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('10:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('10:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('11:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('11:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('12:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('12:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('13:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('13:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('14:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('14:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('15:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('15:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('16:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('16:30', _timeContWidth, _timeContHeigth),
              ContainerPattern('17:00', _timeContWidth, _timeContHeigth),
              ContainerPattern('17:30', _timeContWidth, _timeContHeigth),
            ],
        ),
    );
  }
}