import 'package:flutter/material.dart';

class SwitchViewWeekly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 40,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.black, width: 3),
        ),
        padding: EdgeInsets.all(2),
        color: Colors.orange,
        onPressed: (){
          debugPrint("Weekly Button pressed");
        },
        child: const Text(
          'Woche',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}