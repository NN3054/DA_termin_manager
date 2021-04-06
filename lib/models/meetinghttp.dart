/*import 'dart:convert';

import 'package:termin_manager/models/meeting.dart';

Future<Meeting> createMeeting(String behandlungsart, String vorname, String nachname) async {

  final response = await http.post(
    Uri.https('10.10.10.10:8080','appointments'),
    headers: <String, String>{
      'Content-Type' : 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'Behandlungsart': behandlungsart,
      'Vorname': vorname,
      'Nachname': nachname,
  }),
  );
      if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Meeting.fromJson(jsonDecode(response.body));
  } else {
  // If the server did not return a 201 CREATED response,
  // then throw an exception.
  throw Exception('Failed to load Meeting');
  }
}*/


