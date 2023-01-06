import 'package:flutter/material.dart';

import '../../data/datasource/local_data_source.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: g.isDark
                    ? const LinearGradient(
                        colors: [Color(0xff151517), Color(0xff3A4045)])
                    : null)),
        Center(
          child: CircularProgressIndicator(
            color: g.isDark ? Colors.white : Colors.black,
          ),
        )
      ],
    );
  }
}
