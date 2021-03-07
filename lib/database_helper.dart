import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:termin_manager/models/customer.dart';

import 'models/meeting.dart';


class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'meeting.db'),
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute("CREATE TABLE meetings(id INTEGER PRIMARY KEY, vorname TEXT, nachname TEXT, behandlungsart TEXT)",);
        await db.execute("CREATE Table customers(id INTEGER PRIMARY KEY, vorname TEXT, nachname TEXT, telefonnummer TEXT, email TEXT)",);

        return db;
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  Future<int> insertMeeting(Meeting meeting) async {
    int meetingId = 0;
    Database _db = await database();
    await _db.insert('meetings', meeting.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
          meetingId = value;
    });
    return meetingId;
  }

  Future<void> updateMeeting(int id, String vorname, String nachname, String behandlungsart) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE meetings SET vorname = '$vorname', nachname = '$nachname', behandlungsart = '$behandlungsart' WHERE id = '$id'");
  }

  Future<void> insertCustomer (Customer customer) async {
    Database _db = await database();
    await _db.insert('customers', customer.toMap(),
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


  Future<List<Customer>> getCustomers() async {
    Database _db = await database();
    List<Map<String, dynamic>> customerMap = await _db.query('customers');
    return List.generate(customerMap.length, (index){
      return Customer(
        id: customerMap[index]['id'],
        vorname: customerMap[index]['vorname'],
        nachname: customerMap[index]['nachname'],
        telefonnummer: customerMap[index]['telefonnummer'],
        email: customerMap[index]['email']
      );
    });
  }

  Future<void> deleteMeeting(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM meetings id = '$id'");
  }
}
