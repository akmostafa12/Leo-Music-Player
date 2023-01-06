import 'package:flutter/material.dart';

import '../../data/datasource/local_data_source.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: g.isDark ? null : Colors.white,
      decoration: g.isDark
          ? const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff151517), Color(0xff3A4045)]),
            )
          : null,
      child: Center(
        child: Text(
          'No Music Files Found',
          style: TextStyle(
              fontSize: g.textLarge.toDouble(),
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
