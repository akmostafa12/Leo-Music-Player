import 'package:bubble_slider/bubble_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../translations/local_keys.dart';
import '../../data/datasource/local_data_source.dart';
import '../controller/bloc/music_bloc.dart';
import '../controller/bloc/music_event.dart';
import '../widgets/set_pitch.dart';
import '../widgets/set_speed.dart';

class PlayerBody extends StatelessWidget {
  const PlayerBody({super.key});

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
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                      color: g.isDark ? null : Colors.white,
                                      decoration: g.isDark
                                          ? const BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                Color(0xff151517),
                                                Color(0xff3A4045)
                                              ]),
                                            )
                                          : null,
                                      child: ListView(
                                        children: [
                                          SetPitch('-8', 0.2),
                                          SetPitch('-7', 0.3),
                                          SetPitch('-6', 0.4),
                                          SetPitch('-5', 0.5),
                                          SetPitch('-4', 0.6),
                                          SetPitch('-3', 0.7),
                                          SetPitch('-2', 0.8),
                                          SetPitch('-1', 0.9),
                                          SetPitch('0', 1.0),
                                          SetPitch('+1', 1.1),
                                          SetPitch('+2', 1.2),
                                          SetPitch('+3', 1.3),
                                          SetPitch('+4', 1.4),
                                          SetPitch('+5', 1.5),
                                          SetPitch('+6', 1.6),
                                          SetPitch('+7', 1.7),
                                          SetPitch('+8', 1.8),
                                        ],
                                      ));
                                });
                          },
                          icon: Image.asset('assets/voice changer.png',
                              color: g.isDark ? Colors.white : Colors.black)),
                      Text(
                        LocaleKeys.voiceChanger.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: g.isDark ? Colors.white : Colors.black),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 350,
                                    color: g.isDark ? null : Colors.white,
                                    decoration: g.isDark
                                        ? const BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(0xff151517),
                                              Color(0xff3A4045)
                                            ]),
                                          )
                                        : null,
                                    child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: ListView(
                                          children: [
                                            SetSpeed('0.25', 0.25),
                                            SetSpeed('0.5', 0.5),
                                            SetSpeed('0.75', 0.75),
                                            SetSpeed('1.0', 1.0),
                                            SetSpeed('1.25', 1.25),
                                            SetSpeed('1.75', 1.75),
                                            SetSpeed('2.0', 2.0),
                                          ],
                                        )),
                                  );
                                });
                          },
                          icon: Image.asset(
                            'assets/time stretch.png',
                            color: g.isDark ? Colors.white : Colors.black,
                          )),
                      Text(
                        LocaleKeys.timeStretching.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: g.isDark ? Colors.white : Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Row(children: [
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: QueryArtworkWidget(
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
                ),
                const Spacer(
                  flex: 1,
                ),
              ]),
              const Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  g.isSong
                      ? Expanded(
                          child: Text(
                          g.song!.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: g.isDark ? Colors.white : Colors.black),
                          maxLines: 2,
                        ))
                      : g.song!.title != null
                          ? Expanded(
                              child: Text(
                              g.song!.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      g.isDark ? Colors.white : Colors.black),
                              maxLines: 2,
                            ))
                          : Expanded(
                              child: Text(
                              'Unknown Title',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      g.isDark ? Colors.white : Colors.black),
                            )),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  g.isSong
                      ? Expanded(
                          child: Text(
                          g.song!.artist!,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          maxLines: 2,
                        ))
                      : g.song!.artist != null
                          ? Expanded(
                              child: Text(
                              g.song!.artist!,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              maxLines: 2,
                            ))
                          : const Text(
                              'Unknown Artist',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  g.isSong
                      ? Expanded(
                          child: Text(
                          g.song!.album!,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          maxLines: 2,
                        ))
                      : g.song!.album != null
                          ? Expanded(
                              child: Text(
                              g.song!.album!,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              maxLines: 2,
                            ))
                          : const Expanded(
                              child: Text(
                              'Unknown Album',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            )),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      g.formatDurtion(g.position),
                      style: TextStyle(
                        fontSize: 10,
                        color: g.isDark ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        g.isSong
                            ? Text(g.formatDurtion(g.song!.duration!),
                                style: TextStyle(
                                    fontSize: 10,
                                    color:
                                        g.isDark ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold))
                            : g.song!.duration != null
                                ? Text(g.formatDurtion(g.song!.duration!),
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: g.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold))
                                : Text('00 : 00',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: g.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              BubbleSlider(
                color: g.isDark ? Colors.white : Colors.black,
                bubbleSize: BubbleSize.medium,
                thumbRadiusSpeed: ThumbRadiusSpeed.veryFast,
                bubblesSpeed: BubbleSpeed.veryFast,
                isBubbleVisible: true,
                value: g.position.toDouble(),
                onChanged: (value) {
                  g.position = value.toInt();
                  Duration seek = Duration(milliseconds: g.position.round());
                  g.player.seek(seek);
                  if (value == g.song!.duration) {
                    g.player.seek(Duration.zero);
                  }
                },
                min: 0.0,
                max: double.parse('${g.song?.duration}'),
                onChangeEnd: (double value) {},
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (g.isShuffle) {
                        g.shuffle = true;
                        g.isShuffle = false;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            LocaleKeys.shuffleOn.tr(),
                            style: TextStyle(
                                color: g.isDark ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          backgroundColor:
                              g.isDark ? Colors.white : Colors.black,
                        ));
                      } else {
                        g.shuffle = false;
                        g.isShuffle = true;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            LocaleKeys.shuffleOf.tr(),
                            style: TextStyle(
                                color: g.isDark ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          backgroundColor:
                              g.isDark ? Colors.white : Colors.black,
                        ));
                      }
                    },
                    icon: Image.asset(
                      g.isShuffle
                          ? 'assets/shuffle.png'
                          : 'assets/shuffle1.png',
                      color: g.isDark ? Colors.white : Colors.black,
                      height: 40,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                      onPressed: () async {
                        var m = g.i = g.index;
                        g.isSong = false;

                        g.controller.reverse();

                        if (m <= 0) {
                          g.player.stop();
                        } else {
                          m = g.i = g.index = g.index - 1;
                        }
                        g.song = g.songList![g.i];

                        await g.player.setFilePath(g.song!.data);

                        context.read<MusicBloc>().add(StopMusicEvent());

                        context.read<MusicBloc>().add(PlayMusicEvent());

                        context.read<MusicBloc>().add(GetMusicEvent());
                      },
                      icon: Icon(
                        Icons.skip_previous,
                        color: g.isDark ? Colors.white : Colors.black,
                      ),
                      iconSize: 40),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        g.controller.forward();

                        if (g.isPlay == false) {
                          g.controller.forward();
                          context.read<MusicBloc>().add(StopMusicEvent());
                          context.read<MusicBloc>().add(GetMusicEvent());

                          g.isPlay = true;
                        } else {
                          g.controller.reverse();
                          context.read<MusicBloc>().add(PlayMusicEvent());
                          context.read<MusicBloc>().add(GetMusicEvent());

                          g.isPlay = false;
                        }
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.pause_play,
                        progress: g.controller,
                        size: 40,
                        color: g.isDark ? Colors.white : Colors.black,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      g.controller.reverse();
                      g.isSong = false;
                      var m = g.i = g.index;
                      m = g.i = g.index = g.index + 1;
                      g.song = g.songList![g.i];
                      await g.player.setFilePath(g.song!.data);
                      context.read<MusicBloc>().add(StopMusicEvent());
                      context.read<MusicBloc>().add(PlayMusicEvent());
                      context.read<MusicBloc>().add(GetMusicEvent());
                    },
                    icon: const Icon(Icons.skip_next),
                    color: g.isDark ? Colors.white : Colors.black,
                    iconSize: 40,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                    onPressed: () {
                      if (g.isLoop) {
                        g.loop = true;
                        g.isLoop = false;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            LocaleKeys.repeatOn.tr(),
                            style: TextStyle(
                                color: g.isDark ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          backgroundColor:
                              g.isDark ? Colors.white : Colors.black,
                        ));
                      } else {
                        g.loop = false;
                        g.isLoop = true;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            LocaleKeys.repeatOf.tr(),
                            style: TextStyle(
                                color: g.isDark ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          backgroundColor:
                              g.isDark ? Colors.white : Colors.black,
                        ));
                      }
                    },
                    icon: Image.asset(
                      g.isLoop ? 'assets/loop.png' : 'assets/loop1.png',
                      color: g.isDark ? Colors.white : Colors.black,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              )
            ])));
  }
}
