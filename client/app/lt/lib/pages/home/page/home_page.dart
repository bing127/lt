import 'package:app/common/icon.dart';
import 'package:app/pages/home/home_router.dart';
import 'package:app/pages/home/tabView/FrontEnd_page.dart';
import 'package:app/pages/home/tabView/ai_page.dart';
import 'package:app/pages/home/tabView/android_page.dart';
import 'package:app/pages/home/tabView/backEnd_page.dart';
import 'package:app/pages/home/tabView/column_page.dart';
import 'package:app/pages/home/tabView/follow_page.dart';
import 'package:app/pages/home/tabView/hot_page.dart';
import 'package:app/pages/home/tabView/ios_page.dart';
import 'package:app/pages/home/tabView/recommend_page.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:app/widget/custom_app_search.dart';
import 'package:app/widget/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  TabController _tabController;
  List<Widget> _pageList;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 9);
    _initData();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _showAd();
    });
  }

  void _initData(){
    _pageList = <Widget>[
      FollowPage(),
      RecommendPage(),
      ColumnPage(),
      HotPage(),
      FrontEndPage(),
      BackEndPage(),
      AndroidPage(),
      IosPage(),
      AIPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: CustomAppSearch(
          func: (){
            NavigatorUtils.push(context, HomeRouter.searchPage);
          },
        ),
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
            _tabItem(title: "专栏"),
            _tabItem(title: "热榜"),
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

/// 广告显示
  _showAd() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CustomDialogWidget(
          bgColor: Colors.transparent,
          isMarkClose: true,
          width: ScreenUtil().setWidth(550),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                  bottom: ScreenUtil().setHeight(20)
                ),
                child: IconButton(
                  icon: Icon(
                    IconFont.icon_close,
                    size: ScreenUtil().setSp(70),
                    color: Colors.white,
                  ),
                  onPressed: (){
                    NavigatorUtils.goBack(context);
                  },
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(730),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/icon/ad.png",
                    )
                  )
                ),
              )
            ],
          ),
        )
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
