import 'dart:io';

import 'package:app/app/exception_page.dart';
import 'package:app/app/root_page.dart';
import 'package:flustars/flustars.dart' show SpUtil;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  /// 确保初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// 配置初始化
  await SpUtil.getInstance();

  /// APP入口并配置Provider
  runApp(RootPage());

  /// 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails){
    print(flutterErrorDetails.toString());
    return ExceptionPage();
  };

  // 沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
