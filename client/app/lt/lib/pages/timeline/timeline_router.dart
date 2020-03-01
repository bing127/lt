import 'package:app/pages/timeline/page/timeline_page.dart';
import 'package:app/routers/router_init.dart';
import 'package:fluro/fluro.dart';
class TimelineRouter implements IRouterProvider{

  static String timelinePage = "/timeline";

  @override
  void initRouter(Router router) {
    router.define(timelinePage, handler: Handler(handlerFunc: (_, params) => TimelinePage()));
  }
}