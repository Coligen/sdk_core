import { SDKCore } from '@mopen/core';
import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult
} from '@ohos/flutter_ohos';

export class SdkCorePlugin implements FlutterPlugin, MethodCallHandler {
  private CHANNEL_SDKCORE: string = "mobile.open.sdk/core"
  private context?: Context;
  private sdkCoreChannel?: MethodChannel;

  getUniqueClassName(): string {
    return "mobile.open.sdk.core.SDKCore";
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.context = binding.getApplicationContext();
    this.sdkCoreChannel = new MethodChannel(binding.getBinaryMessenger(), this.CHANNEL_SDKCORE);
    this.sdkCoreChannel?.setMethodCallHandler(this);
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    this.sdkCoreChannel?.setMethodCallHandler(null);
    this.context = undefined;
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    switch (call.method) {
      case "init":
        let appId: string = call.argument("appId");
        let appKey: string = call.argument("appKey");

        if (appId == null || appId == undefined || appKey == null || appKey == undefined) {
          result.error("", "null param not allowed", null);
          return;
        }

        SDKCore.init(this.context, appId, appKey);
        result.success(0);
        break;
      case "initializeOnUserProtocolAgreed":
        SDKCore.initializeOnUserProtocolAgreed();
        result.success(0);
        break;
      default:
        result.notImplemented();
        break;
    }
  }
}