import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/core/services/services_locator.dart';
import 'package:music/translations/codegen_loader.g.dart';
import 'features/data/datasource/local_data_source.dart';
import 'features/presentation/Screens/home.dart';
import 'features/presentation/controller/bloc/music_bloc.dart';
import 'features/presentation/controller/bloc/music_event.dart';
import 'features/presentation/controller/bloc/my_bloc_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [Locale('ar'), Locale('en')],
    fallbackLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    child: BlocProvider(
        create: (context) => MusicBloc(sl(), sl(), sl())..add(GetMusicEvent()),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    g.getTheme();
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        title: 'Leo Music Player',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            )),
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor:
                  g.isDark ? const Color(0xff3A4045) : Colors.white,
              elevation: 0,
            )),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset(
            'assets/art.png',
            color: g.isDark ? Colors.white : Colors.black,
          ),
          nextScreen: const Home(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: g.isDark ? const Color(0xff3A4045) : Colors.white,
        ));
  }
}
