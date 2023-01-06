import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/datasource/local_data_source.dart';

class SetPitch extends StatelessWidget {
  String text;

  double pitch;

  SetPitch(this.text, this.pitch, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        g.player.setPitch(pitch);
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
