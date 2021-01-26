import 'package:flutter/material.dart';
import 'package:termin_manager/body_builder/body_parts/meetings_pattern.dart';

import 'body_parts/time.dart';
import 'body_parts/header.dart';

import 'body_parts/templates/time_container_pattern.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Header(),
          Row(
            children: [
              Time(), MeetingsPattern(),
            ],
          ),
        ],
      ),
    );
  }
}
