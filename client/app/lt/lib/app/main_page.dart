import 'dart:ui';

import 'package:app/app/double_tap_back_exit_app.dart';
import 'package:app/common/icon.dart';
import 'package:app/common/utils/toast.dart';
import 'package:app/pages/find/page/find_page.dart';
import 'package:app/pages/home/page/home_page.dart';
import 'package:app/pages/my/page/my_page.dart';
import 'package:app/pages/timeline/page/timeline_page.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> _appBarTitles = ['首页', '书籍', '龙潭圈', '我的'];
  int _tabIndex = 0;
  List<Widget> _pageList = [];
  var _tabImages = [];
  final PageController _pageController = PageController();
  num _taskTabNum = 0;
  bool _messageTabDot = false;
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return DoubleTapBackExitApp(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildBadge(
                  child: _getTabIcon(0), count: _taskTabNum.toString()),
              title: _buildTabText(0),
            ),
            BottomNavigationBarItem(
              icon: _buildBadge(
                child: _getTabIcon(1),
                count: _messageTabDot ? '1' : '0',
                isDot: true,
              ),
              title: _buildTabText(1),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icon/bbo.webp",
                width: ScreenUtil().setWidth(85),
                height: ScreenUtil().setWidth(85),
              ),
              title: SizedBox.shrink()
            ),
            BottomNavigationBarItem(
              icon: _getTabIcon(2),
              title: _buildTabText(2),
            ),
            BottomNavigationBarItem(
              icon: _getTabIcon(3),
              title: _buildTabText(3),
            )
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: _activeIndex,
          elevation: 3.0,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          selectedItemColor: Color(0xff262626),
          unselectedItemColor: Color(0xffA8A8A8),
          onTap: (int index) {
            if(index == 2){
              _showSendSheet();
            } else {
              int pageIndex  = index > 1 ? index -1 : index;
              _pageController.jumpToPage(pageIndex);
            }
          },
        ),
        body: PageView(
          controller: _pageController,
          children: _pageList,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildTabText(int curIndex) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
      child: Text(_appBarTitles[curIndex]),
    );
  }

  /*
  * icon路径
  */
  Image _getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabImages[index][1];
    } else {
      return _tabImages[index][0];
    }
  }

  /*
  * 处理tabTar图片
  */
  Image getTabImage(String path, {double w = 22.0, double h = 22.0}) {
    var url = "assets/icon/$path.png";
    return Image.asset(url, width: w, height: h);
  }

  void _onPageChanged(int index) {
    int pageIndex = index >= 2 ? index + 1 : index;
    setState(() {
      _activeIndex = pageIndex;
      _tabIndex = index;
    });
  }

  void initData() {
    _tabImages = [
      [getTabImage('ic_tab_home_normal'), getTabImage('ic_tab_home_active')],
      [getTabImage('ic_tab_discovery_normal'), getTabImage('ic_tab_discovery_active')],
      [getTabImage('ic_tab_invest_normal'), getTabImage('ic_tab_invest_active')],
      [getTabImage('ic_tab_mine_normal'), getTabImage('ic_tab_mine_active')]
    ];
    _pageList = [HomePage(), FindPage(),  TimelinePage(), MyPage()];
  }

  Widget _buildBadge({Widget child, String count: "0", bool isDot: false}) {
    return Badge(
      elevation: 0,
      showBadge: int.parse(count) >= 1 ? true : false,
      padding: EdgeInsets.all(isDot ? ScreenUtil().setWidth(10) : (int.parse(count) > 9 ? ScreenUtil().setWidth(4) : ScreenUtil().setWidth(13))),
      position: BadgePosition(
          top: isDot ? -ScreenUtil().setHeight(4) : (-ScreenUtil().setHeight(int.parse(count) > 9 ? 6 : 15)),
          right: -(isDot ? ScreenUtil().setWidth(3) : ScreenUtil().setWidth(13))
      ),
      toAnimate: false,
      badgeContent: !isDot
          ? Text(
        "$count",
        style: TextStyle(color: const Color(0xffffffff), fontSize: 12),
      ) : SizedBox.shrink(),
      child: child,
    );
  }


  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showSendSheet(){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white.withOpacity(0.8),
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (_,state){
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: ScreenUtil().setWidth(4.3), sigmaY: ScreenUtil().setWidth(4.3)),
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - ScreenUtil().setHeight(150),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            _gridMenu()
                          ],
                        ),
                      ),
                      _closeView()
                    ],
                  ),
                ),
              );
            },
          );
        }
    );
  }

  Widget _closeView(){
    return Container(
      height: ScreenUtil().setHeight(150),
      width: double.infinity,
      child: IconButton(
        icon: Icon(
            IconFont.icon_close,
            color: Color(0xff262626),
            size: ScreenUtil().setSp(60),
        ),
        onPressed: (){
          NavigatorUtils.goBack(context);
        },
      ),
    );
  }

  Widget _gridMenu(){
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: ScreenUtil().setHeight(1.8),
      ),
      children: <Widget>[
        _gridMenuItem("发布文章"),
        _gridMenuItem("发布动态"),
        _gridMenuItem("发布动态"),
        _gridMenuItem("发布动态"),
        _gridMenuItem("发布动态"),
        _gridMenuItem("发布动态"),
        _gridMenuItem("发布动态"),
        _gridMenuItem("发布动态"),
        _gridMenuItem("发布动态"),
      ],
    );
  }

  Widget _gridMenuItem(String title){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setWidth(100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/icon/bui.webp"
                      )
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Text(
                "$title",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenUtil().setSp(28)
                ),
              ),
            )
          ],
        ),
        onTap: (){
          Toast.show(title);
        },
      ),
    );
  }
}
