import 'package:app/pages/my/page/my_page.dart';
import 'package:app/routers/router_init.dart';
import 'package:fluro/fluro.dart';
class MyRouter implements IRouterProvider{

  static String myPage = "/my";

  @override
  void initRouter(Router router) {
    router.define(myPage, handler: Handler(handlerFunc: (_, params) => MyPage()));
  }
}