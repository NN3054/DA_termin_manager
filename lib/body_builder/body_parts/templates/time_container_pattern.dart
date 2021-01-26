import 'package:flutter/material.dart';

// standard container which takes arguments for textinput, colorinput, check if sizeinput is passed -> if yes overwrite default
class TimeContainerPattern extends StatelessWidget {
  final String _containerText;
  final double _contWidth;
  final double _contHeight;



  const TimeContainerPattern(this._containerText, this._contWidth, this._contHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _contWidth,
        height: _contHeight,
        padding: EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
            color: Colors.indigoAccent,
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
            borderRadius: BorderRadius.circular((10))),
        child: Text(
          _containerText,
          style: TextStyle(fontSize: 17, color: Colors.white),
          textAlign: TextAlign.center,
        ));
  }
}
