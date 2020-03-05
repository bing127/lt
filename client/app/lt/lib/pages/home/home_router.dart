import 'package:app/pages/home/page/detail_page.dart';
import 'package:app/pages/home/page/home_page.dart';
import 'package:app/pages/home/page/search_page.dart';
import 'package:app/routers/router_init.dart';
import 'package:fluro/fluro.dart';
class HomeRouter implements IRouterProvider{

  static String homePage = "/home";
  static String detailPage = "/home/detail";
  static String searchPage = "/home/search";

  @override
  void initRouter(Router router) {
    router.define(homePage, handler: Handler(handlerFunc: (_, params) => HomePage()));
    router.define(detailPage, handler: Handler(handlerFunc: (_, params) => DetailPage()));
    router.define(searchPage, handler: Handler(handlerFunc: (_, params) => SearchPage()));
  }
}