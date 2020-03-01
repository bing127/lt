import 'package:app/app/main_page.dart';
import 'package:app/app/webview_page.dart';
import 'package:app/app/welcome_page.dart';
import 'package:app/routers/404.dart';
import 'package:app/routers/router_init.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//用户相关页面
import 'package:app/pages/account/account_router.dart';
//主页面
import 'package:app/pages/home/home_router.dart';
import 'package:app/pages/find/find_router.dart';
import 'package:app/pages/timeline/timeline_router.dart';
import 'package:app/pages/my/my_router.dart';
class Routes {

  static String home = "/home";
  static String webViewPage = "/webview";
  static String welcomePage = "/welcome";
  static String previewImagePage = "/previewImage";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        debugPrint("未找到目标页");
        return WidgetNotFound();
      });

    router.define(home, handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) => MainPage()
      )
    );

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params){
      String url = params['url']?.first;
      String title = params['title']?.first;
      return WebViewPage(url: url,title:title);
    }));


    router.define(welcomePage, handler: Handler(handlerFunc: (_, params)=> WelcomePage()));

    _listRouter.clear();
    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(AccountRouter());
    _listRouter.add(HomeRouter());
    _listRouter.add(FindRouter());
    _listRouter.add(TimelineRouter());
    _listRouter.add(MyRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider){
      routerProvider.initRouter(router);
    });
  }
}
