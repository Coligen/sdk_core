import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sdk_core_method_channel.dart';

abstract class SdkCorePlatform extends PlatformInterface {
  SdkCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static SdkCorePlatform _instance = MethodChannelSdkCore();

  static SdkCorePlatform get instance => _instance;

  static set instance(SdkCorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> init(String appId, String appKey) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> initializeOnUserProtocolAgreed() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
