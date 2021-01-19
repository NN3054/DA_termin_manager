import 'package:flutter/material.dart';

import 'body_builder/header.dart';
import 'body_builder/time.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('Test');
    return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xff87e8eb),
          body:
            Column(children: [Header(), Time()]
            ),
        ),
    );
  }
}
