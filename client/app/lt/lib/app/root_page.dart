import 'dart:io';

import 'package:app/app/main_page.dart';
import 'package:app/routers/application.dart';
import 'package:app/routers/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RootPage extends StatefulWidget {

  RootPage() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Color(0xffF2F2F2),
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'OI',
      showPerformanceOverlay: false, //显示性能标签
      debugShowCheckedModeBanner: false,
      checkerboardRasterCacheImages: false,
      showSemanticsDebugger: false, // 显示语义视图
      onGenerateRoute: Application.router.generator,
      home: MainPage(),
      theme: ThemeData(
        textTheme: TextTheme(
            subhead: TextStyle(textBaseline: TextBaseline.alphabetic)
        ),
        primaryColor: Colors.white,
        dividerColor: Color(0xFFEEEEEE),
        scaffoldBackgroundColor: Color(0xffF4F6FA),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US')
      ],
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
      locale: const Locale("en", "US"),
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
    );
  }
}
