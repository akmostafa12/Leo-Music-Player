import '../../domain/repository/base_music_repository.dart';
import '../datasource/local_data_source.dart';

class MusicRepository implements BaseMusicRepository {
  BaseLocalDataSource baseLocalDataSource;

  MusicRepository(this.baseLocalDataSource);

  @override
  getMusic() async {
    return await baseLocalDataSource.getMusic();
  }

  @override
  playMusic() async {
    return await baseLocalDataSource.PlayMusic();
  }

  @override
  stopMusic() async {
    return await baseLocalDataSource.StopMusic();
  }
}
