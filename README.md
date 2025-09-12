## SDKCore-Flutter平台插件
</br>
SDKCore是其他业务类SDK的基础认证模块，集成其他业务SDK时必须先集成SDKCore并完成授权资料配置。

</br>

### 仓库说明
本仓库是基于各原生平台的SDKCore模块，最终对接Flutter平台的插件实现，同时提供了简单的example，开发者可以参考example程序实现授权资料的配置。

</br>

### 平台支持
目前已完成插件对接的平台如下：

- Android。对应仓库中的android目录。
- Harmony。对应仓库中的ohos目录。

若有需要，开发者可参考Android和Harmony平台，自行实现iOS平台的插件代码。

</br>

### 接口列表
Flutter平台的插件接口与原生平台的接口保持一致(即接口名称、参数列表、返回值类型均保持一致)：

```dart
/// SDKCore模块初始化。
/// 开发者需要通过商务窗口获取授权相关资料，并将授权资料中的 [appId] 和 [appKey] 作为参数传入接口中。
/// APP可在初始化时立即调用此接口, 此接口在APP生命周期内仅需调用一次。
/// 此接口需要开发者完成授权资料配置后才能调用成功，授权资料配置详见文档后续部分。
Future<void> init(String appId, String appKey)

/// SDKCore模块隐私权配置。
/// 一般而言，需要用户同意APP隐私协议后调用此接口，防止出现隐私政策违规风险。
/// 此接口在APP生命周期内仅需调用一次。
Future<void> initializeOnUserProtocolAgreed()
```

注意：SDKCore模块在Android平台有特殊的init方式，因此init接口在Android平台的实现中是一个空调用，并非Bug。详见 *授权资料配置* 小节说明。

</br>

### 授权资料配置
开发者在获取到SDK的授权资料后，需要在原生平台中进行配置，只有在正确配置后，SDKCore模块才能正常初始化，配置错误会导致SDKCore工作异常导致其他业务SDK接口无法正常调用。</br>

开发者可通过商务渠道获取授权资料配置，此处不作详细说明。授权资料包含以下三个要素：
- APP_ID ： 字符串，系统为APP分配的身份标识。
- APP_KEY ：  字符串，SDK访问系统资源的权限标识。
- .license ： 文件，APP访问系统时的必要资料，开发者可忽略具体格式及内容，但不要对此文件进行任何修改。

注意：每个平台的授权资料是独立的，开发者需要注意切勿混用。

各平台配置方式如下：

#### Android
- 将.license文件原样放入项目的assets根目录中。
- 编辑AndroidManifest.xml文件，添加权限配置：
    ```xml
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
    <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
    ```
- 编辑AndroidManifest.xml文件，在application节点内添加如下内容，将value内的APP_ID和APP_KEY替换为自己的信息：
    ```xml
    <meta-data
        android:name="mobile.open.APP_ID"
        android:value="APP_ID" />
    <meta-data
        android:name="mobile.open.APP_KEY"
        android:value="APP_KEY" />
    ```

相关参考可在仓库的example/android目录中找到。

#### Harmony
- 将.license文件原样放入项目的resources/rawfile根目录中。

相关参考可在仓库的example/ohos目录中找到。

#### iOS
iOS平台的配置待后续补充。

</br>

### 集成方式
本目前仅支持git仓库源码方式集成，开发者可在Flutter工程pubspec.yaml文件的dependencies节点下添加配置：
```yaml
sdk_core:
    git:
      url: https://github.com/Coligen/sdk_core.git
      ref: main
```

添加后保存文件，Flutter会自动去更新依赖，若没有自动更新，开发者可自行在终端中执行 flutter pub get 触发更新。

</br>

### 调用示例
开发者确认插件集成、授权资料配置无误后，即可在Flutter项目中调用接口进行初始化工作了，我们推荐在main函数中调用，示例如下：
```dart
// 确保插件已初始化完成
WidgetsFlutterBinding.ensureInitialized();

// 此处示例的APP_ID和APP_KEY对应example的Harmony类型授权，开发者注意自行替换
await SdkCore.init("2025713681", "0985a99f25017534bf2c39323bf8b6ec4325c9c007f4de80eecac1e1eeab39e9");
/// 此处为便捷写法,实际项目中请在用户同意《用户协议》和《隐私授权》后再调用此接口,避免合规风险
await SdkCore.initializeOnUserProtocolAgreed();
```

相关参考可在仓库的example/lib/main.dart中找到。

