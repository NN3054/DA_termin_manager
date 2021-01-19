import 'package:flutter/material.dart';

// standard container which takes arguments for textinput, colorinput, check if sizeinput is passed -> if yes overwrite default
class Container extends StatelessWidget {
  String containerText;
  double containerWidth;

  Container({this.containerText})
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
