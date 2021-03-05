import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/meeting.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'meeting.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE meetings(id INTEGER PRIMARY KEY, vorname TEXT, nachname TEXT, behandlungsart TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<void> insertMeeting(Meeting meeting) async {
    Database _db = await database();
    await _db.insert('meetings', meeting.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Meeting>> getMeetings() async {
    Database _db = await database();
    List<Map<String, dynamic>> meetingMap = await _db.query('meetings');
    return List.generate(meetingMap.length, (index) {
      return Meeting(
          id: meetingMap[index]['id'],
          vorname: meetingMap[index]['vorname'],
          nachname: meetingMap[index]['nachname'],
          behandlungsart: meetingMap[index]['behandlungsart']);
    });
  }
}
