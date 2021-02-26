import 'package:flutter/material.dart';
import 'package:align_positioned/align_positioned.dart';

class PlusButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 40,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 3),
        ),
        color: Colors.orange,
        padding: EdgeInsets.all(2),
        onPressed: () {
          debugPrint("Plus Button pressed");
        },
        child: const Text(
          '+',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
