import 'package:app/common/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "我的",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(36)
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _top(),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            _cell(
                IconFont.icon_remind_fill,
                "消息中心"
            ),
            _cell(
              IconFont.icon_credit_level_fill,
              "我的收藏"
            ),
            _cell(
                IconFont.icon_form_fill,
                "浏览记录"
            ),
            _cell(
                IconFont.icon_email_fill,
                "意见反馈"
            ),
            _cell(
                IconFont.icon_email_fill,
                "专栏作者"
            ),
            _cell(
                IconFont.icon_set1,
                "设置"
            ),
          ],
        ),
      ),
    );
  }

  Widget _top(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          bottom: ScreenUtil().setHeight(30),
          top: ScreenUtil().setHeight(30),
          right: ScreenUtil().setWidth(30)
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20),
          top: ScreenUtil().setHeight(30),
          bottom: ScreenUtil().setHeight(30)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage("https://user-gold-cdn.xitu.io/2019/2/28/169337feeaad7976?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1"),
                  radius: ScreenUtil().setWidth(60),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "^你的酒窝没有酒",
                            style: TextStyle(
                                color: Color(0xff111111),
                                fontSize: ScreenUtil().setSp(33)
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          Text(
                            "全栈开发工程师",
                            style: TextStyle(
                                color: Color(0xffA8A8A8)
                            ),
                            softWrap: true,
                          )
                        ],
                      ),
                      Icon(
                          IconFont.icon_arrow_right,
                          color: Color(0xffE7E7E7),
                          size: ScreenUtil().setSp(43),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _topItem(
                  IconFont.icon_gift,
                  "关注",
                  88
                ),
                _topItem(
                  IconFont.icon_like,
                  "点赞",
                  23
                ),
                _topItem(
                  IconFont.icon_collection,
                  "收藏",
                  15
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0,0,0,.05),
                offset: Offset(0.0, ScreenUtil().setHeight(7)),
                blurRadius: ScreenUtil().setHeight(7),
                spreadRadius: ScreenUtil().setHeight(3)
            )
          ],
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(6))
        ),
      ),
    );
  }

  Widget _topItem(IconData icon,String title,int total){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Color(0xffBF8C4B),
          size: ScreenUtil().setSp(80),
        ),
        Container(
          child: Text(
            "$title",
            style: TextStyle(
                color: Color(0xff111111),
                fontSize: ScreenUtil().setSp(26)
            ),
          ),
          margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(10),
            bottom: ScreenUtil().setHeight(10)
          ),
        ),
        Text(
          "$total",
          style: TextStyle(
              color: Color(0xff7A7C7B),
              fontSize: ScreenUtil().setSp(26)
          ),
        )
      ],
    );
  }

  Widget _cell(IconData icon,String title){
    return Material(
      color: Colors.white,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(30),
              right: ScreenUtil().setWidth(30),
              top: ScreenUtil().setHeight(30),
              bottom: ScreenUtil().setHeight(30)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Color(0xff9FADC0),
                    size: ScreenUtil().setSp(46),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    "$title",
                    style: TextStyle(
                      color: Color(0xff3E3E3E),
                      fontSize: ScreenUtil().setSp(30)
                    ),
                  )
                ],
              ),
              Icon(
                  IconFont.icon_arrow_right,
                  color: Color(0xffE7E7E7),
                size: ScreenUtil().setSp(43),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
