// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "aboutUs": "تابعنا",
    "title": "الموسيقى",
    "playingNow": "قيد التشغيل",
    "voiceChanger": "تغيير الصوت",
    "timeStretching": "تمديد الوقت",
    "followUs": "تابعنا على",
    "repeatOn": "تم تفعيل وضع الاعاده",
    "repeatOf": "تم تعطيل وضع الاعاده",
    "shuffleOn": "تم تشغيل الوضع العشوائى",
    "shuffleOf": "تم تعطيل الوضع العشوائى",
    "by": "تم الانشاء بواسطه : مصطفى امين",
    "leo": "ليو مشغل الموسيقى",
    "facebook": "فيسبوك",
    "instgram": "انستجرام",
    "youtube": "يوتيوب"
  };
  static const Map<String, dynamic> en = {
    "aboutUs": "About Us",
    "title": "My Music",
    "playingNow": "Playing Now",
    "voiceChanger": "Voice Changer",
    "timeStretching": "Time Stretching",
    "followUs": "Follow Us",
    "repeatOn": "Repeat Mode Is On",
    "repeatOf": "Repeat Mode Is Of",
    "shuffleOn": "Shuffle Mode Is On",
    "shuffleOf": "Shuffle Mode Is Of",
    "by": "Powered By Mostafa Amin",
    "leo": "Leo Music Player",
    "facebook": "Facebook",
    "instgram": "Instgram",
    "youtube": "Youtube"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
