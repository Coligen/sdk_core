import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sdk_core_method_channel.dart';

abstract class SdkCorePlatform extends PlatformInterface {
  /// Constructs a SdkCorePlatform.
  SdkCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static SdkCorePlatform _instance = MethodChannelSdkCore();

  /// The default instance of [SdkCorePlatform] to use.
  ///
  /// Defaults to [MethodChannelSdkCore].
  static SdkCorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SdkCorePlatform] when
  /// they register themselves.
  static set instance(SdkCorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
