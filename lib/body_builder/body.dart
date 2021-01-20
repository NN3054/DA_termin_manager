import 'package:flutter/material.dart';

import 'body_parts/time.dart';
import 'body_parts/header.dart';

import 'body_parts/templates/container_pattern.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Header(),
          Row(
            children: [Time()],
          ),
        ],
      ),
    );
  }
}
