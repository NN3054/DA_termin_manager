import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:termin_manager/HomeScreen.dart';
import 'package:termin_manager/database_helper.dart';
import 'package:termin_manager/models/customer.dart';
import 'package:termin_manager/models/http_service.dart';

class ExistingCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: existingCustomer(),
    );
  }
}

class existingCustomer extends StatefulWidget {
  @override
  _existingCustomerState createState() => _existingCustomerState();
}

class _existingCustomerState extends State<existingCustomer> {
  bool checked = false;
  List<int> selectedList = [];

  final TextEditingController _controller = TextEditingController();
  final HttpService httpService = HttpService();
  Future<Customer> _futureCustomer;

  Future<List<PostSearch>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(10, (int index) {
      return PostSearch(
        "Vorname $index",
        "Nachname $index",
      );
    });
  }

 /* Future<List<Customer>> searchCustomer(String name) async{
    var res = await db.query(
    "customers",
      where: "vorname LIKE ?",
        whereArgs: ['%$name']
    );
    List<Customer> customerList = res.map((element)=> Customer(
      id: element['id'],
      vorname: element['vorname'],
      nachname: element['nachname'],
      telefonnummer: element['telefonnummer'],
      email: element['email']
    ));
    return customerList;
  }*/

  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff34ebb1),
        elevation: 0,
        title: Text(
          "Bestehende Kunden",
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBar(
                  onSearch: search,
                  onItemFound: (PostSearch post, int index) {
                    return ListTile(
                      title: Text(post.vorname),
                      subtitle: Text(post.nachname),
                    );
                  },
                ),
              ),
            ),
            /*FutureBuilder(
              future: httpService.getPosts(),
              builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot){

                print('DATEN: ${snapshot.data}');

                if (snapshot.hasData){

                  List<Post> posts = snapshot.data;

                  return ListView(
                    children: posts.map((Post post) => ListTile(
                      title: Text(post.forename),
                    )).toList(),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),*/
            FutureBuilder(
                future: _futureCustomer,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                })
          ],
        ),
      ),
    );
  }
}

class PostSearch {
  final String vorname;
  final String nachname;

  PostSearch(this.vorname, this.nachname);
}
