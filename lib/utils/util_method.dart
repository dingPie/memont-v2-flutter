import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class UtilMethod {
  static String getBaseUrl() {
    String? baseUrl = kReleaseMode
        ? dotenv.env['PROD_API_BASE_URL']
        : Platform.isAndroid
            ? dotenv.env['DEV_ANDROID_API_BASE_URL']
            : dotenv.env['DEV_IOS_API_BASE_URL'];
    return baseUrl ?? '';
  }

  static Color hexToColor(String? hexColor) => hexColor == null
      ? Colors.white
      : Color(int.parse('0xFF${(hexColor).split('#')[1]}'));
}
