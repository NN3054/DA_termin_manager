import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Header extends StatelessWidget {
  //Containers on top
  final Container _containerZeit = Container(
      width: 65,
      height: 40,
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
      ));
  final Container _containerMon = Container(
      width: 65,
      height: 40,
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: BorderRadius.circular((10))),
      child: Text(
        'Mon',
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ));
  final Container _containerDie = Container(
      width: 65,
      height: 40,
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: BorderRadius.circular((10))),
      child: Text(
        'Die',
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ));
  final Container _containerMit = Container(
      width: 65,
      height: 40,
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: BorderRadius.circular((10))),
      child: Text(
        'Mit',
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ));
  final Container _containerDon = Container(
      width: 65,
      height: 40,
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: BorderRadius.circular((10))),
      child: Text(
        'Don',
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ));
  final Container _containerFri = Container(
      width: 65,
      height: 40,
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: BorderRadius.circular((10))),
      child: Text(
        ' Fri ',
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ));

  //Building the containers
  @override
  Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 3),
        child: Row(
          children: <Widget>[
            _containerZeit,
            _containerMon,
            _containerDie,
            _containerMit,
            _containerDon,
            _containerFri
          ],
        ),
      );
  }
}
