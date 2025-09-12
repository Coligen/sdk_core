import 'sdk_core_platform_interface.dart';

class SdkCore {
  /// SDKCore模块初始化。
  /// 开发者需要通过商务窗口获取授权相关资料，并将授权资料中的 [appId] 和 [appKey] 作为参数传入接口中。
  /// APP可在初始化时立即调用此接口, 此接口在APP生命周期内仅需调用一次。
  /// 此接口需要开发者完成授权资料配置后才能调用成功，授权资料配置详见README说明。
  static Future<void> init(String appId, String appKey) {
    return SdkCorePlatform.instance.init(appId, appKey);
  }

  /// SDKCore模块隐私权配置。
  /// 一般而言，需要用户同意APP隐私协议后调用此接口，防止出现隐私政策违规风险。
  /// 此接口在APP生命周期内仅需调用一次。
  static Future<void> initializeOnUserProtocolAgreed() {
    return SdkCorePlatform.instance.initializeOnUserProtocolAgreed();
  }
}
