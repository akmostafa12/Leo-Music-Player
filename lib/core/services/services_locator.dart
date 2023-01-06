import 'package:get_it/get_it.dart';
import '../../features/data/datasource/local_data_source.dart';
import '../../features/data/repository/music_repository.dart';
import '../../features/domain/repository/base_music_repository.dart';
import '../../features/domain/usecases/get_music_usecase.dart';
import '../../features/domain/usecases/play_music_usecase.dart';
import '../../features/domain/usecases/stop_music_usecase.dart';
import '../../features/presentation/controller/bloc/music_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton(() => MusicBloc(sl(), sl(), sl()));
    sl.registerLazySingleton(() => GetMusic(sl()));
    sl.registerLazySingleton(() => PlayMusic(sl()));
    sl.registerLazySingleton(() => StopMusic(sl()));
    sl.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());
    sl.registerLazySingleton<BaseMusicRepository>(() => MusicRepository(sl()));
  }
}
