import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sdk_core_platform_interface.dart';

class MethodChannelSdkCore extends SdkCorePlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('mobile.open.sdk/core');

  @override
  Future<void> init(String appId, String appKey) async {
    try {
      final ret = await methodChannel.invokeMethod('init', {'appId': appId, 'appKey': appKey});
      log('invoke method: init returned with: $ret');
    } on MissingPluginException {
      log('invoke method: init error, not implemented on target platform');
    } on PlatformException catch (e) {
      log('invoke method: init error of platform: $e');
    } catch (e) {
      log('invoke method: init error other: $e');
    }
  }

  @override
  Future<void> initializeOnUserProtocolAgreed() async {
    try {
      final ret = await methodChannel.invokeMethod('initializeOnUserProtocolAgreed');
      log('invoke method: initializeOnUserProtocolAgreed returned with: $ret');
    } on MissingPluginException {
      log('invoke method: initializeOnUserProtocolAgreed error, not implemented on target platform');
    } on PlatformException catch (e) {
      log('invoke method: initializeOnUserProtocolAgreed error of platform: $e');
    } catch (e) {
      log('invoke method: initializeOnUserProtocolAgreed error other: $e');
    }
  }
}
