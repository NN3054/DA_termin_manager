import 'package:flutter/material.dart';
import 'package:termin_manager/HomeScreen.dart';
import 'file:///C:/Users/Nils/Documents/Diplomarbeit/termin_manager/lib/models/MeetingWidget.dart';
import 'package:termin_manager/database_helper.dart';
import 'package:termin_manager/models/meeting.dart';

class NewMeeting extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: newMeeting(),
    );
  }
}

class newMeeting extends StatefulWidget {

  final Meeting meeting;
  @required newMeeting({this.meeting});

  @override
  _newMeetingState createState() => _newMeetingState();
}

class _newMeetingState extends State<newMeeting> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked_start;
  TimeOfDay picked_end;

  final inputControllerBehandlungsart = TextEditingController();
  final inputControllerVorname = TextEditingController();
  final inputControllerNachname = TextEditingController();

  String vorname_submitted;
  String nachname_submitted;
  String behandlungsart_submitted;

  Future<Null> selectStartTime(BuildContext context) async {
    picked_start = await showTimePicker(
      context: context,
      initialTime: _time,
      helpText: 'Startzeit auswählen',
      confirmText: 'Bestätigen',
      cancelText: 'Abbrechen',
    );
    setState(() {
      _time = picked_start;
      print("Startzeit $_time");
    });
  }

  Future<Null> selectEndTime(BuildContext context) async {
    picked_end = await showTimePicker(
      context: context,
      initialTime: _time,
      helpText: 'Endzeit auswählen',
      confirmText: 'Bestätigen',
      cancelText: 'Abbrechen',
    );
    setState(() {
      _time = picked_end;
      print("Endzeit $_time");
    });
  }

  // must implement IOS-Datepicker for OS-Switch
  Future<Null> selectDate(BuildContext context) async {
    DateTime date = DateTime.now();
    var dateString;

    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1970),
        lastDate: DateTime(2100),
        helpText: 'Datum auswählen',
        confirmText: 'Bestätigen',
        cancelText: 'Abbrechen');

    if (pickedDate != null && pickedDate != date) {
      setState(() {
        date = pickedDate;
        dateString = date.toString();
        print(dateString);

        return dateString;
      });
    }
  }


  String _behandlungsart = "";
  String _vorname = "";
  String _nachname = "";

  @override
  void initState(){
    if(widget.meeting != null){
      _behandlungsart = widget.meeting.behandlungsart;
      _nachname = widget.meeting.nachname;
      _vorname = widget.meeting.vorname;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff34ebb1),
        elevation: 0,
        title: Text(
          "Termindaten",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 30,
              color: Color(0xff34ebb1),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(
                        controller: inputControllerVorname..text = _vorname,
                        onSubmitted: (vorname) async {
                          vorname_submitted = vorname;
                          print("Vorname: $vorname");
                        },
                        decoration: InputDecoration(
                            hintText: "Vorname eingeben",
                            border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(
                        controller: inputControllerNachname..text = _nachname,
                        onSubmitted: (nachname) {

                          nachname_submitted = nachname;

                          print("Nachname: $nachname");
                        },
                        decoration: InputDecoration(
                            hintText: "Nachname eingeben",
                            border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(
                        onSubmitted: (behandlungsart) {

                          behandlungsart_submitted = behandlungsart;

                          print("Behandlungsart: $behandlungsart");
                        },
                        controller: inputControllerBehandlungsart..text = _behandlungsart,
                        decoration: InputDecoration(
                            hintText: "Behandlungsart eingeben",
                            border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.green.withOpacity(0.2)),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            print("Kunde wird ausgewählt");
                          },
                          child: Text(
                            "Kunde auswählen",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                child: Text(
                                  "Datum auswählen:",
                                  style: TextStyle(fontSize: 17),
                                ),
                                width: 150,
                              ),
                              Container(
                                child: IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () {
                                    selectDate(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            SizedBox(
                              child: Text(
                                "Startzeit:",
                                style: TextStyle(fontSize: 17),
                              ),
                              width: 70,
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.alarm),
                                onPressed: () {
                                  selectStartTime(context);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              child: Text(
                                "Endzeit:",
                                style: TextStyle(fontSize: 17),
                              ),
                              width: 70,
                            ),
                            Container(
                              child: IconButton(
                                icon: Icon(Icons.alarm),
                                onPressed: () {
                                  selectEndTime(context);
                                },
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color(0xff34ebb1),
                            ),
                            child: InkWell(
                              onTap: () async {
                                if (vorname_submitted != "" && nachname_submitted != "" && behandlungsart_submitted != "") {
                                  if(widget.meeting == null) {
                                    DatabaseHelper _dbHelper = DatabaseHelper();
                                    Meeting _newMeeting = Meeting(
                                        vorname: inputControllerVorname.text,
                                        nachname: inputControllerNachname.text,
                                        behandlungsart: inputControllerBehandlungsart
                                            .text);
                                    await _dbHelper.insertMeeting(_newMeeting);
                                    print("Erstellt");
                                  }
                                  else {
                                    print("Update the existing task");
                                  }
                                }
                                print("Termin: ${inputControllerBehandlungsart.text}, hinzugefügt, Daten:  Datum: Startzeit: $picked_start Endzeit:$picked_end ");
                              },
                              child: Center(
                                child: Text(
                                  "Termin hinzufügen",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
