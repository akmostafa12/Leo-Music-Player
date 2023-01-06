import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:page_transition/page_transition.dart';

import '../../data/datasource/local_data_source.dart';
import '../Screens/player.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 80,
          width: double.infinity,
          color: g.isDark ? const Color(0xff3A4045) : Colors.white,
          child: Card(
            color: g.isDark ? Colors.transparent : Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: const Duration(milliseconds: 500),
                      child: Player()),
                );
              },
              leading: QueryArtworkWidget(
                size: 500,
                keepOldArtwork: true,
                artworkQuality: FilterQuality.high,
                artworkFit: BoxFit.fill,
                id: g.song!.id,
                type: ArtworkType.AUDIO,
                nullArtworkWidget: Image.asset(
                  'assets/art.png',
                  color: g.isDark ? Colors.white : Colors.black,
                ),
              ),
              title: Text(
                g.song!.title ?? ' Unknown Title',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: g.textMedium.toDouble(),
                    color: g.isDark ? Colors.white : Colors.black),
                maxLines: 2,
              ),
              subtitle: Text(
                g.song!.artist != null ? g.song!.artist! : 'Unknown Artist',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: g.textSmall.toDouble(),
                    color: Colors.grey),
                maxLines: 2,
              ),
              trailing: CircleAvatar(
                radius: 22,
                child: FloatingActionButton(
                    onPressed: () {
                      g.controller.forward();

                      if (g.isPlay == false) {
                        g.controller.forward();
                        g.player.pause();
                        g.isPlay = true;
                      } else {
                        g.controller.reverse();
                        g.player.play();

                        g.isPlay = false;
                      }
                    },
                    backgroundColor: g.isDark ? Colors.white : Colors.black,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.pause_play,
                      progress: g.controller,
                      size: 40,
                      color: g.isDark ? Colors.black : Colors.white,
                    )),
              ),
            ),
          )),
    );
  }
}
