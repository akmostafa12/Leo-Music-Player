import 'package:flutter/foundation.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../core/services/services_locator.dart';
import '../../presentation/controller/bloc/music_bloc.dart';

MusicBloc g = MusicBloc(sl(), sl(), sl());

abstract class BaseLocalDataSource {
  getMusic();

  PlayMusic();

  StopMusic();
}

class LocalDataSource implements BaseLocalDataSource {
  @override
  getMusic() async {
    if (!kIsWeb) {
      bool permissionStatus = await g.audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await g.audioQuery.permissionsRequest();
      }
    }
    g.songList = await g.audioQuery.querySongs(
      sortType: SongSortType.TITLE,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
  }

  @override
  PlayMusic() {
    g.player.play();
  }

  @override
  StopMusic() {
    g.player.stop();
  }
}
