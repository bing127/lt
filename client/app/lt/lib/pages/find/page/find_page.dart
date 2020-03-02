import 'package:app/pages/find/model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "书籍",
          style: TextStyle(fontSize: ScreenUtil().setSp(36)),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _bookItem(),
            _bookItem(),
            _bookItem(),
            _bookItem(),
            _bookItem(),
          ],
        ),
      ),
    );
  }

  Widget _bookItem() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          StickyHeader(
            header: Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  right: ScreenUtil().setWidth(30)),
              color: Color(0xffF4F6FA),
              height: ScreenUtil().setHeight(70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Golang语言",
                    style: TextStyle(
                        color: Color(0xff909090),
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenUtil().setSp(30)
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "最后更新：",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(27),
                              color: Color(0xff909090)
                          )
                      ),
                      TextSpan(
                          text: "09:23",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(27),
                              color: Color(0xff4286F5)
                          )
                      )
                    ]),
                  )
                ],
              ),
            ),
            content: Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  right: ScreenUtil().setWidth(30),
                  top: ScreenUtil().setHeight(20)),
              child: GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: ScreenUtil().setWidth(20),
                    mainAxisSpacing: ScreenUtil().setWidth(20),
                    childAspectRatio: ScreenUtil().setWidth(1.3)
                ),
                children: <Widget>[
                  _bookChildItem(),
                  _bookChildItem(),
                  _bookChildItem(),
                  _bookChildItem(),
                  _bookChildItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bookChildItem() {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10),
                bottom: ScreenUtil().setHeight(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PhysicalModel(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8)),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://static.bookstack.cn/projects/learn-go-by-example/uploads/201802/1511d21582eab2dd.jpg/cover",
                    height: ScreenUtil().setHeight(220),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Container(
                  child: Text(
                    "Go示例学(Go By Example 中文版)",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: ScreenUtil().setSp(28)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
