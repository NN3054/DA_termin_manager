import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        border: Border.all(
          color: Colors.black,
          width: 4,
        ),
      ),
    );
  }
}
