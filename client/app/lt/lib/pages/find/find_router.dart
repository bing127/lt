import 'package:app/pages/find/page/find_page.dart';
import 'package:app/routers/router_init.dart';
import 'package:fluro/fluro.dart';
class FindRouter implements IRouterProvider{

  static String findPage = "/find";

  @override
  void initRouter(Router router) {
    router.define(findPage, handler: Handler(handlerFunc: (_, params) => FindPage()));
  }
}