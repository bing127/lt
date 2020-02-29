import 'package:app/pages/account/page/account_page.dart';
import 'package:app/routers/router_init.dart';
import 'package:fluro/fluro.dart';
class AccountRouter implements IRouterProvider{

  static String accountPage = "/account";

  @override
  void initRouter(Router router) {
    router.define(accountPage, handler: Handler(handlerFunc: (_, params) => AccountPage()));
  }
}