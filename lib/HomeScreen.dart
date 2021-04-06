import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:termin_manager/screens/NewMeeting.dart';
import 'package:termin_manager/screens/NewCustomer.dart';
import 'package:termin_manager/screens/ExistingCustomer.dart';
import 'package:termin_manager/models/MeetingWidget.dart';
import 'package:termin_manager/database_helper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: homeScreen(),
    );
  }
}

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String filterType = "heute";
  String taskPop = "close";
  DateTime today = new DateTime.now();
  bool _isClosed = false;

  DatabaseHelper _dbHelper = DatabaseHelper();

  var monthNames = [
    "Januar",
    "Februar",
    "März",
    "April",
    "Mai",
    "Juni",
    "Juli",
    "August",
    "September",
    "Oktober",
    "November",
    "Dezember"
  ];

  List<String> recipients = ["436503068487"];

  CalendarController ctrlr = new CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Color(0xff34ebb1),
                elevation: 0,
                title: Text(
                  "Termine",
                  style: TextStyle(fontSize: 30),
                ),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.short_text,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: null)
                ],
              ),
              Container(
                height: 70,
                color: Color(0xff34ebb1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("heute");
                          },
                          child: Text(
                            "Heute",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "heute")
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("woche");
                          },
                          child: Text(
                            "Woche",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "woche")
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    )
                  ],
                ),
              ),
              (filterType == "woche")
                  ? TableCalendar(
                      calendarController: ctrlr,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      initialCalendarFormat: CalendarFormat.month,
                    )
                  : Container(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Heute, am ${today.day}. ${monthNames[today.month - 1]} ${today.year}",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        initialData: [],
                        future: _dbHelper.getMeetings(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => newMeeting(
                                                meeting: snapshot.data[index],
                                              )),
                                    ).then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: Dismissible(
                                    key: UniqueKey(),
                                    child: MeetingWidget(
                                      vorname: snapshot.data[index].vorname,
                                      nachname: snapshot.data[index].nachname,
                                      behandlungsart:
                                          snapshot.data[index].behandlungsart,
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 110,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xff34ebb1),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Column(
                                  children: [
                                     IconButton(
                                          icon: Icon(
                                            Icons.menu,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          onPressed: (){
                                            print("Menu aufgerufen");
                                          }
                                          ),
                                  ],
                                ),
                              ),
                            Container(
                              width: 80,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.sms,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: (){
                                        _sendSMS("Guten Tag! Eine freundliche Erinnerung an Ihren Termin bei der Physiotherapie Naumann in 48h. MfG Isabelle", recipients);
                                        print('SMS verschickt');
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.black, Color(0xff328fa8)]),
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: openTaskPop,
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
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
          Container(
              child: (taskPop == "open")
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.3),
                      child: Center(
                        child: InkWell(
                          onTap: closeTaskPop,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 1,
                                ),
                                InkWell(
                                  onTap: openNewMeeting,
                                  child: Container(
                                    child: Text(
                                      "Neuer Termin",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                InkWell(
                                  onTap: openNewNote,
                                  child: Container(
                                    child: Text(
                                      "Neuer Kunde",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                InkWell(
                                  onTap: openNewCheckList,
                                  child: Container(
                                    child: Text(
                                      "Bestehende Kunden",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()),
        ],
      ),
    );
  }

  // Functions
  openTaskPop() {
    taskPop = "open";
    setState(() {});
  }

  closeTaskPop() {
    taskPop = "close";
    setState(() {});
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  openNewMeeting() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => newMeeting(
                meeting: null,
              )),
    ).then((value) {
      setState(() {});
    });
  }

  openNewNote() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewCustomer()));
  }

  openNewCheckList() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExistingCustomer()));
  }

  void _sendSMS(String message, List<String> recipients) async {
    String _result = await sendSMS(message: message, recipients: recipients).catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
