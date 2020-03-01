import 'package:app/pages/home/page/home_page.dart';
import 'package:app/routers/router_init.dart';
import 'package:fluro/fluro.dart';
class HomeRouter implements IRouterProvider{

  static String homePage = "/home";

  @override
  void initRouter(Router router) {
    router.define(homePage, handler: Handler(handlerFunc: (_, params) => HomePage()));
  }
}