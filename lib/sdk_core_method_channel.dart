import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sdk_core_platform_interface.dart';

/// An implementation of [SdkCorePlatform] that uses method channels.
class MethodChannelSdkCore extends SdkCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sdk_core');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
