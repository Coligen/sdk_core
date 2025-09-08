import 'package:flutter_test/flutter_test.dart';
import 'package:sdk_core/sdk_core.dart';
import 'package:sdk_core/sdk_core_platform_interface.dart';
import 'package:sdk_core/sdk_core_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSdkCorePlatform
    with MockPlatformInterfaceMixin
    implements SdkCorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SdkCorePlatform initialPlatform = SdkCorePlatform.instance;

  test('$MethodChannelSdkCore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSdkCore>());
  });

  test('getPlatformVersion', () async {
    SdkCore sdkCorePlugin = SdkCore();
    MockSdkCorePlatform fakePlatform = MockSdkCorePlatform();
    SdkCorePlatform.instance = fakePlatform;

    expect(await sdkCorePlugin.getPlatformVersion(), '42');
  });
}
