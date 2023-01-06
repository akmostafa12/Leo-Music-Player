import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/usecases/get_music_usecase.dart';
import '../../../domain/usecases/play_music_usecase.dart';
import '../../../domain/usecases/stop_music_usecase.dart';
import 'music_event.dart';

part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  GetMusic getMusic;
  PlayMusic playMusic;
  StopMusic stopMusic;
  final OnAudioQuery audioQuery = OnAudioQuery();
  int textLarge = 18;
  int textMedium = 16;
  int textSmall = 13;
  List<SongModel>? songList;
  int? art;
  bool isIndex = true;
  final player = AudioPlayer();
  int i = 0;
  int index = 0;
  SongModel? song;
  late AnimationController controller;
  bool isBottom = false;
  bool isMode = false;
  Timer? timer;
  int position = 0;
  double slider = 0;
  bool isDark = true;
  bool isSong = true;
  bool loop = false;
  bool isLoop = true;
  bool shuffle = false;
  bool isShuffle = true;
  bool isPlay = false;
  bool enabled = true;
  String dropDownButton = 'en';

  final Future<SharedPreferences> sp = SharedPreferences.getInstance();

  String formatDurtion(int ms) {
    Duration duration = Duration(milliseconds: ms);
    int minute = duration.inMinutes;
    int seconds = (duration.inSeconds > 60)
        ? (duration.inSeconds % 60)
        : duration.inSeconds;
    String format =
        '${(minute < 10) ? '0$minute' : '$minute'}:${(seconds < 10) ? '0$seconds' : '$seconds'}';
    return format;
  }

  MusicBloc(this.getMusic, this.playMusic, this.stopMusic)
      : super(MusicInitial()) {
    on<MusicEvent>((event, emit) async {
      if (event is GetMusicEvent) {
        emit(Loading());
        try {
          await getMusic.excute();
          emit(Success());
        } catch (e) {
          emit(Error());
        }
      } else if (event is PlayMusicEvent) {
        await playMusic.excute();
        emit(Playing());
      } else if (event is StopMusicEvent) {
        await stopMusic.excute();
        emit(Stoped());
      }
    });
  }

  Future<bool> setTheme(bool th) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var p = preferences.setBool('theme', th);
    return p;
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var p = preferences.getBool('theme');
    if (p != null) {
      return isDark = p;
    } else {
      return isDark = true;
    }
  }
}
