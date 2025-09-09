import 'sdk_core_platform_interface.dart';

class SdkCore {
  static Future<void> init(String appId, String appKey) {
    return SdkCorePlatform.instance.init(appId, appKey);
  }

  static Future<void> initializeOnUserProtocolAgreed() {
    return SdkCorePlatform.instance.initializeOnUserProtocolAgreed();
  }
}
