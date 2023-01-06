import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../translations/local_keys.dart';
import '../../data/datasource/local_data_source.dart';
import '../controller/bloc/music_bloc.dart';
import '../views/error_body.dart';
import '../views/loading_body.dart';
import '../views/success_body.dart';
import 'contactus.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.topToBottom,
                            duration: const Duration(milliseconds: 500),
                            child: ContactUs()));
                  },
                  child: Text(LocaleKeys.aboutUs.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: g.textSmall.toDouble(),
                          color: g.isDark ? Colors.white : Colors.black))),
              const Spacer(
                flex: 1,
              ),
              Text(
                LocaleKeys.title.tr(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: g.textLarge.toDouble(),
                    color: g.isDark ? Colors.white : Colors.black),
              ),
              const Spacer(
                flex: 1,
              ),
              DropdownButton(
                items: ['en', 'ar']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: g.textLarge.toDouble(),
                                color: Colors.black),
                          ),
                        ))
                    .toList(),
                onChanged: (val) async {
                  g.dropDownButton = val.toString();
                  if (g.dropDownButton == 'en') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please Restart The App',
                        style: TextStyle(
                            color: g.isDark ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      backgroundColor: g.isDark ? Colors.white : Colors.black,
                    ));
                    setState(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'من فضلك قم باعاده تشغيل التطبيق',
                        style: TextStyle(
                            color: g.isDark ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      backgroundColor: g.isDark ? Colors.white : Colors.black,
                    ));
                    setState(() {});
                  }

                  await context.setLocale(Locale(g.dropDownButton));
                  setState(() {});
                },
                value: g.dropDownButton,
              ),
              const Spacer(
                flex: 1,
              ),
              IconButton(
                  onPressed: () {
                    if (g.isMode) {
                      g.isDark = true;
                      g.isMode = false;
                      g.setTheme(true);
                    } else {
                      g.isDark = false;
                      g.isMode = true;
                      g.setTheme(false);
                    }
                    setState(() {});
                  },
                  icon: Image.asset(
                    'assets/mode.png',
                    color: g.isDark ? Colors.white : Colors.black,
                    height: 30,
                  )),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: g.isDark ? null : Colors.white,
          flexibleSpace: g.isDark
              ? Container(
                  decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff151517), Color(0xff3A4045)]),
                ))
              : null,
        ),
        body: BlocBuilder<MusicBloc, MusicState>(
          builder: (context, state) {
            if (state is Loading) {
              return LoadingBody();
            } else if (state is Success) {
              return SuccessBody();
            } else {
              return ErrorBody();
            }
          },
        ));
  }
}
