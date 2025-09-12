import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sdk_core/sdk_core.dart';

void main() async {
  // 确保插件已初始化完成
  WidgetsFlutterBinding.ensureInitialized();

  // 此处示例的APP_ID和APP_KEY对应example的Harmony类型授权，开发者注意自行替换
  await SdkCore.init("2025713681", "0985a99f25017534bf2c39323bf8b6ec4325c9c007f4de80eecac1e1eeab39e9");
  // 此处为便捷写法,实际项目中请在用户同意《用户协议》和《隐私授权》后再调用此接口,避免合规风险
  await SdkCore.initializeOnUserProtocolAgreed();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Running SDKCore example'),
        ),
      ),
    );
  }
}
