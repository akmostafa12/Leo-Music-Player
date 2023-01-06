import '../repository/base_music_repository.dart';

class StopMusic {
  BaseMusicRepository baseMusicRepository;

  StopMusic(this.baseMusicRepository);

  excute() async {
    return await baseMusicRepository.stopMusic();
  }
}
