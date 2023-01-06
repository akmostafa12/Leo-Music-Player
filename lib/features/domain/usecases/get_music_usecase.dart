import '../repository/base_music_repository.dart';

class GetMusic {
  BaseMusicRepository baseRepository;

  GetMusic(this.baseRepository);

  excute() async {
    return await baseRepository.getMusic();
  }
}
