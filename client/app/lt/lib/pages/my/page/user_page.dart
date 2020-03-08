import 'package:app/common/icon.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with TickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController = new ScrollController();
  double _navAlpha = 0.0;
  double threshold = 100;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(tabControllerListener);
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      if (offset <= 0) {
        setState(() {
          _navAlpha = 0;
        });
      } else {
        setState(() {
          _navAlpha = 1;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(tabControllerListener);
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  int index;
  void tabControllerListener() {
    if (index != _tabController.index) {
      index = _tabController.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      body: _buildScaffoldBody(context),
    );
  }

  Widget _buildScaffoldBody(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    var pinnedHeaderHeight = statusBarHeight +kToolbarHeight;
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (c, f) {
          return [
            SliverAppBar(
                pinned: true,
              elevation: 0,
                expandedHeight: ScreenUtil().setHeight(350),
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Image.asset(
                              "assets/icon/bg.png",
                              fit: BoxFit.fill,
                            )
                        )
                      ],
                    )
                ),
              centerTitle: true,
              brightness: _navAlpha >0 ? Brightness.light : Brightness.dark,
              leading: IconButton(
                icon: Icon(
                  IconFont.icon_arrow_lift,
                  color: _navAlpha >0 ? Colors.black : Colors.white,
                  size: ScreenUtil().setSp(60),
                ),
                onPressed: (){
                  NavigatorUtils.goBack(context);
                },
              ),
              title: Opacity(
                opacity: _navAlpha,
                child: Text(
                  "你的酒窝没有酒",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(36)
                  ),
                ),
              ),
            ),
          ];
        },
        pinnedHeaderSliverHeightBuilder: () {
          return pinnedHeaderHeight;
        },
        body: SafeArea(
          top: false,
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.blue,
                  indicatorColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2.0,
                  isScrollable: false,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Tab0"),
                    Tab(text: "Tab1"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: ListView.builder(
                          itemCount: 56,
                          itemBuilder: (_,index){
                            return Text(
                                "1-$index"
                            );
                          }
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: 100,
                          itemBuilder: (_,index){
                            return Text(
                                "2-$index"
                            );
                          }
                      ),
                      color: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  Future onRefresh(){
    return null;
  }
}
