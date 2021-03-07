import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:termin_manager/screens/NewMeeting.dart';

import '../database_helper.dart';

class MeetingWidget extends StatelessWidget {
  final String vorname;
  final String nachname;
  final String behandlungsart;

  DatabaseHelper _dbHelper = DatabaseHelper();

  MeetingWidget({this.vorname, this.nachname, this.behandlungsart});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0, 9),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xff328fa8), width: 4),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$vorname $nachname" ?? "Leer",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                    "09:30 - 10:00 $behandlungsart" ?? "Leer 2",
                    style: TextStyle(color: Colors.grey, fontSize: 18))
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 50,
              width: 5,
              color: Color(0xff328fa8),
            )
          ],
        ),
    );
  }
}
