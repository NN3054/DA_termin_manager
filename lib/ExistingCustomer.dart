import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:termin_manager/HomeScreen.dart';

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

  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(10, (int index) {
      return Post(
        "Vorname $index",
        "Nachname $index",
      );
    });
  }

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
                  onItemFound: (Post post, int index) {
                    return ListTile(
                      title: Text(post.vorname),
                      subtitle: Text(post.nachname),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final String vorname;
  final String nachname;

  Post(this.vorname, this.nachname);
}
