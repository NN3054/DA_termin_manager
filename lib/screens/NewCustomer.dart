import 'package:flutter/material.dart';
import 'package:termin_manager/database_helper.dart';
import 'package:termin_manager/models/customer.dart';
import '../HomeScreen.dart';

class NewCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'avenir'),
        home: newCustomer());
  }
}

class newCustomer extends StatefulWidget {
  @override
  _newCustomerState createState() => _newCustomerState();
}

class _newCustomerState extends State<newCustomer> {
  final inputControllerVorname = TextEditingController();
  final inputControllerNachname = TextEditingController();
  final inputControllerNummer = TextEditingController();
  final inputControllerEmail = TextEditingController();

  String vorname;
  String nachname;
  String telefonnummer;
  String email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff34ebb1),
        elevation: 0,
        title: Text(
          "Kundendaten",
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(
                        onSubmitted: (value){

                          vorname = value;

                        },

                        controller: inputControllerVorname,
                        decoration: InputDecoration(
                            hintText: "Vorname", border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(

                        onSubmitted: (value){

                          nachname = value;

                        },
                        controller: inputControllerNachname,
                        decoration: InputDecoration(
                            hintText: "Nachname", border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(

                        onSubmitted: (value){

                          telefonnummer = value;

                        },

                        controller: inputControllerNummer,
                        decoration: InputDecoration(
                            hintText: "Telefonnummer",
                            border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(

                        onSubmitted: (value){

                          email = value;

                        },

                        controller: inputControllerEmail,
                        decoration: InputDecoration(
                            hintText: "E-Mail", border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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

                                if(vorname != "" && nachname != ""){

                                  DatabaseHelper _dbHelper = DatabaseHelper();
                                  Customer _newCustomer = Customer(
                                    vorname: inputControllerVorname.text,
                                    nachname: inputControllerNachname.text,
                                    telefonnummer: inputControllerNummer.text,
                                    email: inputControllerEmail.text,
                                  );
                                  await _dbHelper.insertCustomer(_newCustomer);
                                  print('Kunde hinzugefügt');
                                }
                                else {
                                  print("fehler");
                                }


                                print(
                                    "Kunde hinzugefügt. Vorname: ${inputControllerVorname.text}, Nachname: ${inputControllerNachname.text}, Telefonnummer ${inputControllerNummer.text}, Email: ${inputControllerEmail.text}");
                              },
                              child: Center(
                                child: Text(
                                  "Kunde hinzufügen",
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
                    )
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
