import 'sdk_core_platform_interface.dart';

class SdkCore {
  Future<String?> getPlatformVersion() {
    return SdkCorePlatform.instance.getPlatformVersion();
  }
}
