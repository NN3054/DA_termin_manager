import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import './templates/time_container_pattern.dart';

class Header extends StatelessWidget {
  //Containers on top
  final Container _containerZeit = Container(
      width: 65,
      height: 30,
      margin: EdgeInsets.only(left: 2),
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: BorderRadius.circular((10))),
      child: Text(
        'Zeit',
        style: TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
  );

  //Building the containers
  @override
  Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 3),
        child: Row(
          children: <Widget>[
            _containerZeit,
            TimeContainerPattern('Mon', 65, 30),
            TimeContainerPattern('Die', 65, 30),
            TimeContainerPattern('Mit', 65, 30),
            TimeContainerPattern('Don', 65, 30),
            TimeContainerPattern('Fri', 65, 30),
          ],
        ),
      );
  }
}
