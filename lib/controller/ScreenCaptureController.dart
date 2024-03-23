import 'package:flutter/services.dart';
import 'dart:io';

class ScreenCaptureController {
  static const MethodChannel _channel =
  MethodChannel('disable_screenshot');

  static final ScreenCaptureController _instance =
  ScreenCaptureController._internal();

  factory ScreenCaptureController() {
    return _instance;
  }

  ScreenCaptureController._internal();

  Future<void> disableScreenshots() async {
    if (Platform.isAndroid) {
      try {
        await _channel.invokeMethod('disableScreenshots');
      } on PlatformException catch (e) {
        print("Failed to disable screenshots: '${e.message}'.");
      }
    } else if (Platform.isIOS) {
      try {
        await _channel.invokeMethod('disableScreenshots');
      } on PlatformException catch (e) {
        print("Failed to disable screenshots: '${e.message}'.");
      }
    }
  }

}
