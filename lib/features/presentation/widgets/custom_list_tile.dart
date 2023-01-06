import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:page_transition/page_transition.dart';

import '../../data/datasource/local_data_source.dart';
import '../Screens/player.dart';
import '../controller/bloc/music_bloc.dart';
import '../controller/bloc/music_event.dart';

class CustomListTile extends StatelessWidget {
  int index;

  CustomListTile(this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () async {
          await g.player.setFilePath(g.songList![index].data);
          context.read<MusicBloc>().add(StopMusicEvent());
          context.read<MusicBloc>().add(PlayMusicEvent());
          context.read<MusicBloc>().add(GetMusicEvent());
          g.i = index;
          g.isBottom = true;

          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 500),
                child: Player()),
          );
        },
        title: Text(
          g.song!.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: g.textMedium.toDouble(),
              color: g.isDark ? Colors.white : Colors.black),
          maxLines: 2,
        ),
        subtitle: Text(
          g.song!.artist ?? "No Artist",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: g.textMedium.toDouble(),
              color: g.isDark ? Colors.white : Colors.black),
          maxLines: 2,
        ),
        trailing: Text(g.formatDurtion((g.song!.duration!)),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: g.textSmall.toDouble(),
                color: g.isDark ? Colors.white : Colors.black)),
        // This Widget will query/load image. Just add the id and type.
        // You can use/create your own widget/method using [queryArtwork].
        leading: QueryArtworkWidget(
          size: 500,
          artworkFit: BoxFit.fill,
          keepOldArtwork: true,
          artworkQuality: FilterQuality.high,
          id: g.song!.id,
          type: ArtworkType.AUDIO,
          nullArtworkWidget: Image.asset(
            'assets/art.png',
            color: g.isDark ? Colors.white : Colors.black,
          ),
        ));
  }
}
