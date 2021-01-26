import 'package:flutter/material.dart';

class UsedMeetingsPattern extends StatelessWidget {
  final double _contHeight = 30;
  final double _contWidth = 65;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: _contWidth,
      height: _contHeight,
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          color: Colors.purple,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: BorderRadius.circular((10))),
      child: Text(
        'USED',
        style: TextStyle(fontSize: 17, color: Colors.black),
        textAlign: TextAlign.center,
      ) ,
    );
  }
}
