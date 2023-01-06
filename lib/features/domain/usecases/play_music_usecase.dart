import '../repository/base_music_repository.dart';

class PlayMusic {
  BaseMusicRepository baseMusicRepository;

  PlayMusic(this.baseMusicRepository);

  excute() async {
    return await baseMusicRepository.playMusic();
  }
}
