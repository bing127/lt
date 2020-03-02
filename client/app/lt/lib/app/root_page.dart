import 'package:app/app/welcome_page.dart';
import 'package:app/routers/application.dart';
import 'package:app/routers/routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';

class RootPage extends StatelessWidget {

  RootPage() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: '龙潭',
        showPerformanceOverlay: false, //显示性能标签
        debugShowCheckedModeBanner: false,
        checkerboardRasterCacheImages: false,
        showSemanticsDebugger: false, // 显示语义视图
        onGenerateRoute: Application.router.generator,
        home: WelcomePage(),
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
              subhead: TextStyle(textBaseline: TextBaseline.alphabetic),
          ),
          primaryColor: Colors.white,
          dividerColor: Color(0xFFEEEEEE),
          scaffoldBackgroundColor: Color(0xffF4F6FA),
          fontFamily: "helveticaneuelight",
          accentColor: Color(0xff4286F5)
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
        localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
          return locale;
        },
      ),
        /// Toast 配置
        backgroundColor: Colors.black54,
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        textStyle: TextStyle(
          fontSize: 13
        ),
    );
  }
}
