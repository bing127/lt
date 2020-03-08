import 'package:app/pages/my/page/collect_page.dart';
import 'package:app/pages/my/page/column_page.dart';
import 'package:app/pages/my/page/edit_page.dart';
import 'package:app/pages/my/page/history_page.dart';
import 'package:app/pages/my/page/idea_page.dart';
import 'package:app/pages/my/page/message_page.dart';
import 'package:app/pages/my/page/my_page.dart';
import 'package:app/pages/my/page/setting_page.dart';
import 'package:app/pages/my/page/user_page.dart';
import 'package:app/routers/router_init.dart';
import 'package:fluro/fluro.dart';

class MyRouter implements IRouterProvider {
  static String myPage = "/my";
  static String userPage = "/my/user";
  static String editPage = "/my/edit";
  static String messagePage = "/my/message";
  static String collectPage = "/my/collect";
  static String historyPage = "/my/history";
  static String ideaPage = "/my/idea";
  static String columnPage = "/my/column";
  static String settingPage = "/my/setting";

  @override
  void initRouter(Router router) {
    router.define(myPage, handler: Handler(handlerFunc: (_, params) => MyPage()));
    router.define(userPage, handler: Handler(handlerFunc: (_, params) => UserPage()));
    router.define(editPage, handler: Handler(handlerFunc: (_, params) => EditPage()));
    router.define(messagePage, handler: Handler(handlerFunc: (_, params) => MessagePage()));
    router.define(collectPage, handler: Handler(handlerFunc: (_, params) => CollectPage()));
    router.define(historyPage, handler: Handler(handlerFunc: (_, params) => HistoryPage()));
    router.define(ideaPage, handler: Handler(handlerFunc: (_, params) => IdeaPage()));
    router.define(columnPage, handler: Handler(handlerFunc: (_, params) => ColumnPage()));
    router.define(settingPage, handler: Handler(handlerFunc: (_, params) => SettingPage()));
  }
}
