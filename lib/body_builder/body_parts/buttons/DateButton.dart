import 'package:flutter/material.dart';

class DateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 40,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.black, width: 3),
        ),
        padding: EdgeInsets.all(2),
        color: Colors.orange,
        onPressed: (){},
        child: const Text(
          '01.01.2020 \n KW 1',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
