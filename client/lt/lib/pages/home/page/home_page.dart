import 'package:app/pages/home/tabView/FrontEnd_page.dart';
import 'package:app/pages/home/tabView/ai_page.dart';
import 'package:app/pages/home/tabView/android_page.dart';
import 'package:app/pages/home/tabView/backEnd_page.dart';
import 'package:app/pages/home/tabView/follow_page.dart';
import 'package:app/pages/home/tabView/ios_page.dart';
import 'package:app/pages/home/tabView/recommend_page.dart';
import 'package:app/widget/custom_app_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _pageList;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 7);
    _initData();
    super.initState();
  }

  void _initData(){
    _pageList = <Widget>[
      FollowPage(),
      RecommendPage(),
      FrontEndPage(),
      BackEndPage(),
      AndroidPage(),
      IosPage(),
      AIPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: CustomAppSearch(),
        elevation: 0.0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Color(0xffA8A8A8),
          labelColor: Color(0xff262626),
          indicatorColor: Color(0xff4286F5),
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabs: <Widget>[
            _tabItem(title: "关注"),
            _tabItem(title: "推荐"),
            _tabItem(title: "前端"),
            _tabItem(title: "后端"),
            _tabItem(title: "Android"),
            _tabItem(title: "Ios"),
            _tabItem(title: "人工智能"),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: _pageList,
        ),
      ),
    );
  }

  Widget _tabItem({String title}) {
    return Tab(
      text: title,
    );
  }
}
