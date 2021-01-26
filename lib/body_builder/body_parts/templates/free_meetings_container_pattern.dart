import 'package:flutter/material.dart';

class FreeMeetingsPatternContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

    width: 65,
    height: 30,
    padding: EdgeInsets.only(top: 2),
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(
    color: Colors.black,
    width: 4,
    ),
    borderRadius: BorderRadius.circular((10))),
    child: Text(
    '30 min',
    style: TextStyle(fontSize: 17, color: Colors.black),
    textAlign: TextAlign.center,
    ) ,
    );
  }
}
