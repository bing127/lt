import 'package:app/common/utils/AndroidBackTop.dart';
import 'package:app/pages/find/page/find_page.dart';
import 'package:app/pages/home/page/home_page.dart';
import 'package:app/pages/my/page/my_page.dart';
import 'package:app/pages/timeline/page/timeline_page.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> _appBarTitles = ['首页', '发现', '龙潭圈', '我的'];
  int _tabIndex = 0;
  List<Widget> _pageList = [];
  var _tabImages = [];
  final _pageController = PageController();
  num _taskTabNum = 0;
  bool _messageTabDot = false;

  Widget _buildTabText(int curIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
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
  Image getTabImage(String path, {double w = 24.0, double h = 24.0}) {
    var url = "assets/icon/$path.png";
    return Image.asset(url, width: w, height: h);
  }

  void _onPageChanged(int index) {
    setState(() {
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
    _pageList = [HomePage(), FindPage(), TimelinePage(), MyPage()];
  }

  Widget _buildBadge({Widget child, String count: "0", bool isDot: false}) {
    return Badge(
      elevation: 0,
      showBadge: int.parse(count) >= 1 ? true : false,
      padding: EdgeInsets.all(isDot
          ? ScreenUtil().setWidth(10)
          : (int.parse(count) > 9
          ? ScreenUtil().setWidth(4)
          : ScreenUtil().setWidth(13))),
      position: BadgePosition(
          top: isDot
              ? -ScreenUtil().setHeight(4)
              : (-ScreenUtil().setHeight(int.parse(count) > 9 ? 6 : 15)),
          right:
          -(isDot ? ScreenUtil().setWidth(3) : ScreenUtil().setWidth(13))),
      toAnimate: false,
      badgeContent: !isDot
          ? Text(
        "$count",
        style: TextStyle(color: const Color(0xffffffff), fontSize: 12),
      )
          : SizedBox(),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return WillPopScope(
      onWillPop: () async {
        AndroidBackTop.backDeskTop();
        return false;
      },
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
          currentIndex: _tabIndex,
          elevation: 3.0,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          selectedItemColor: Color(0xff0F82FF),
          unselectedItemColor: Color(0xff666666),
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _pageList,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
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
}
