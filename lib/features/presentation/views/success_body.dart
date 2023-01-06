import 'package:flutter/material.dart';

import '../../data/datasource/local_data_source.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/mini_player.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: g.isDark ? null : Colors.white,
          decoration: g.isDark
              ? const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff151517), Color(0xff3A4045)]),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        g.songList?.length != null ? g.songList!.length : 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      g.song = g.songList![index];
                      return CustomListTile(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        g.isBottom
            ? const MiniPlayer()
            : const Align(alignment: Alignment.bottomCenter, child: SizedBox())
      ],
    );
  }
}
