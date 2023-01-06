import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:music/translations/local_keys.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../translations/local_keys.dart';
import '../../../translations/local_keys.dart';
import '../../data/datasource/local_data_source.dart';

class ContactUs extends StatelessWidget {
  String facebook = 'https://www.facebook.com/mostafa.amin.08';
  String instgram = 'https://www.instagram.com/mostafa_amin881/';
  String youtube = 'https://www.youtube.com/channel/UC2KDRd6vwDyLiZ7zNvUo8aw';

  ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: g.isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            LocaleKeys.leo.tr(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: g.isDark ? Colors.white : Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: g.isDark ? null : Colors.white,
          flexibleSpace: g.isDark
              ? Container(
                  decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff151517), Color(0xff3A4045)]),
                ))
              : null),
      body: Container(
        color: g.isDark ? null : Colors.white,
        decoration: g.isDark
            ? const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff151517), Color(0xff3A4045)]),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Center(
            child: Column(
              children: [
                Text(
                  '${LocaleKeys.followUs.tr()} : ',
                  style: TextStyle(
                    color: g.isDark ? Colors.white : Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(facebook,
                        mode: LaunchMode.externalApplication,
                        webViewConfiguration: const WebViewConfiguration(
                          enableJavaScript: true,
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        size: 30,
                        color: g.isDark ? Colors.white : Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        LocaleKeys.facebook.tr(),
                        style: TextStyle(
                          color: g.isDark ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(instgram,
                        mode: LaunchMode.externalApplication,
                        webViewConfiguration: const WebViewConfiguration(
                          enableJavaScript: true,
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/instgram.ico',
                          height: 30,
                          width: 30,
                          color: g.isDark ? Colors.white : Colors.black),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        LocaleKeys.instgram.tr(),
                        style: TextStyle(
                          color: g.isDark ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(youtube,
                        mode: LaunchMode.externalApplication,
                        webViewConfiguration: const WebViewConfiguration(
                          enableJavaScript: true,
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/youtube.png',
                        height: 30,
                        width: 30,
                        color: g.isDark ? Colors.white : Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        LocaleKeys.youtube.tr(),
                        style: TextStyle(
                          color: g.isDark ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  LocaleKeys.by.tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: g.isDark ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
