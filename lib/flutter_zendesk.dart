import 'dart:async';

import 'package:flutter/services.dart';

class FlutterZendesk {
  static const MethodChannel _channel = const MethodChannel('flutter_zendesk');

  static Future<String?> initiateZendesk({required Map<String, dynamic> params}) async {
    return await _channel.invokeMethod('initiate', params);
  }
}
