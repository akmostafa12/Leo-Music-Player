import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/datasource/local_data_source.dart';

class SetSpeed extends StatelessWidget {
  String text;

  double speed;

  SetSpeed(this.text, this.speed, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        g.player.setSpeed(speed);
      },
      child: Text(
        text,
        style: TextStyle(
            color: g.isDark ? Colors.white : Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
