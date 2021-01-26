import 'package:flutter/material.dart';

import 'body_builder/body_parts/header.dart';
import 'body_builder/body_parts/time.dart';
import 'body_builder/body_parts/templates/time_container_pattern.dart';
import './body_builder/body.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('App started');
    return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xff87e8eb),
          body:
            Body(),
        ),
    );
  }
}
