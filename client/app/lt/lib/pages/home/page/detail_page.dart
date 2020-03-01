import 'package:app/common/icon.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            IconFont.icon_arrow_lift,
            color: Colors.black,
            size: ScreenUtil().setSp(60),
          ),
          onPressed: (){
            NavigatorUtils.goBack(context);
          },
        ),
        title: Text(
          "文章详情",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(36)
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
              IconFont.icon_share,
              color: Colors.black,
              size: ScreenUtil().setSp(60),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  right: ScreenUtil().setWidth(30)
              ),
              child: Text(
                "前后端分离全栈项目的开发与部署流程前后端分离全栈项目的开发与部署流程",
                style: TextStyle(
                    color: Color(0xff262626),
                    fontSize: ScreenUtil().setSp(36),
                    height: ScreenUtil().setHeight(2.5)
                ),
              ),
              margin: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(20)
              ),
            ),
            _articleTop(),
            _commentView()
          ],
        ),
      ),
      bottomSheet: _footerBtn(),
    );
  }

  Widget _articleTop(){
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          bottom: ScreenUtil().setHeight(30),
          right: ScreenUtil().setWidth(30)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage("https://user-gold-cdn.xitu.io/2019/10/15/16dcdf8e62c21d12?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1"),
                radius: ScreenUtil().setWidth(46),
              ),
              Container(
                child: Text(
                  "jsliushen",
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: ScreenUtil().setSp(35)
                  ),
                ),
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(20),
                    right: ScreenUtil().setWidth(20)
                ),
              ),
              Text(
                "3分钟前",
                style: TextStyle(
                    color: Color(0xff909090),
                    fontSize: ScreenUtil().setSp(26)
                ),
              )
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      IconFont.icon_add_select,
                      color: Color(0xff4286F5),
                      size: ScreenUtil().setSp(40),
                    ),
                    Text(
                      "关注",
                      style: TextStyle(
                          color: Color(0xff4286F5),
                          fontSize: ScreenUtil().setSp(26)
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xff4286F5),
                        width: ScreenUtil().setWidth(1.5)
                    ),
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))
                ),
                padding: EdgeInsets.all(
                    ScreenUtil().setWidth(6)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _footerBtn(){
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: ScreenUtil().setHeight(90),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
                right: ScreenUtil().setWidth(10)
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(10),
                    right: ScreenUtil().setWidth(10),
                    top: ScreenUtil().setHeight(15),
                    bottom: ScreenUtil().setHeight(15)
                ),
                child: Text(
                  "有何高见，展开讲讲",
                  style: TextStyle(
                      color: Color(0xffB2B4B3)
                  ),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                    color: Color(0xffF7F8FC),
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))
                ),
              ),
            ),
          ),
          /// 评论
          _btn(
              162,
              IconFont.icon_comments
          ),
          /// 评论
          _btn(
            162,
            IconFont.icon_like
          ),
          _btn(
              6,
              IconFont.icon_star
          ),
          _btn(
              16,
              IconFont.icon_share
          )
        ],
      ),
    );
  }

  Widget _btn(int total,IconData icon){
    Widget child;
    double right = 0;
    if(total < 10){
      right = ScreenUtil().setWidth(10);
      child = Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(40),
        height: ScreenUtil().setWidth(40),
        decoration: BoxDecoration(
            color: Color(0xffFCD3DE),
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(50)),
            border: Border.all(color: Colors.white,width: ScreenUtil().setWidth(3))
        ),
        child: Text(
          "$total",
          style: TextStyle(
              color: Color(0xffDE7079),
              fontSize: ScreenUtil().setSp(25)
          ),
        ),
      );
    } else {
      if(total >= 10 && total < 100){
        right = ScreenUtil().setWidth(9);
      } else {
        right = 0;
      }
      child = Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xffFCD3DE),
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(50)),
            border: Border.all(color: Colors.white,width: ScreenUtil().setWidth(3))
        ),
        padding: EdgeInsets.all(ScreenUtil().setWidth(3)),
        child: Text(
          "$total",
          style: TextStyle(
              color: Color(0xffDE7079),
              fontSize: ScreenUtil().setSp(25)
          ),
        ),
      );
    }
    return Stack(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(100),
          height: double.infinity,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: Colors.black,
            size: ScreenUtil().setSp(55),
          ),
        ),
        Positioned(
          right: right,
          top: 0,
          child: child,
        )
      ],
    );
  }

  Widget _commentView(){
    return Container(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20)
      ),
      color: Color(0xffF4F6FA),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          right: ScreenUtil().setWidth(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(60),
              child: Row(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(40),
                    width: ScreenUtil().setWidth(5),
                    decoration: BoxDecoration(
                        color: Color(0xff4286F5),
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3))
                    ),
                    margin: EdgeInsets.only(
                        right: ScreenUtil().setWidth(20)
                    ),
                  ),
                  Text(
                    "评论区",
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: ScreenUtil().setSp(30)
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _commentItem()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _commentItem(){
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(20)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage("https://user-gold-cdn.xitu.io/2019/10/15/16dcdf8e62c21d12?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1"),
            radius: ScreenUtil().setWidth(40),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(15),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "不在乎的在乎",
                  style: TextStyle(
                    color: Color(0xff878787),
                    fontSize: ScreenUtil().setSp(28)
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Text(
                  "有代码地址的吗？我是伸手党",
                  style: TextStyle(
                    color: Color(0xff292929),
                    fontSize: ScreenUtil().setSp(28)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}