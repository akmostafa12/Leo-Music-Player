import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../translations/local_keys.dart';
import '../../data/datasource/local_data_source.dart';
import '../views/player_body.dart';
import 'home.dart';

class Player extends StatefulWidget {
  const Player({
    Key? key,
  }) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> with TickerProviderStateMixin {
  getPosition() {
    g.timer = Timer.periodic(
        Duration(milliseconds: g.player.position.inMilliseconds), (_) async {
      setState(() {});
      g.position = g.player.position.inMilliseconds;
      if (g.position == g.player.duration!.inMilliseconds) {
        if (g.loop == true) {
          g.player.seek(Duration.zero);
        }
        if (g.loop == false) {
          g.controller.reverse();
          g.isSong = false;
          setState(() {});
          var m = g.i = g.index;
          m = g.i = g.index = g.index + 1;
          await g.player.setFilePath(g.songList![g.i].data);
          await g.player.stop();
          await g.player.play();
        }
        if (g.shuffle == true) {
          g.controller.reverse();
          g.isSong = false;
          setState(() {});
          var m = g.i = g.index;
          m = g.i = g.index = g.index + 2;
          await g.player.setFilePath(g.songList![g.i].data);
          g.player.stop();
          g.player.play();
        }
      } else {
        g.position++;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPosition();
    g.controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      g.song = g.songList![g.i];
    } catch (ex) {
      g.player.stop();
      g.player.play();
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: g.isDark ? Colors.white : Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              }),
          title: Text(
            LocaleKeys.playingNow.tr(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: g.isDark ? Colors.white : Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: g.isDark ? null : Colors.white,
          flexibleSpace: g.isDark
              ? Container(
                  decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff151517), Color(0xff3A4045)]),
                ))
              : null,
          actions: [
            IconButton(
                onPressed: () {
                  if (g.isMode) {
                    g.isDark = true;
                    g.isMode = false;
                    g.setTheme(true);
                  } else {
                    g.isDark = false;
                    g.isMode = true;
                    g.setTheme(false);
                  }
                },
                icon: Image.asset(
                  'assets/mode.png',
                  color: g.isDark ? Colors.white : Colors.black,
                  height: 30,
                )),
          ],
        ),
        body: PlayerBody());
  }
}
