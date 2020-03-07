import 'package:app/common/icon.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              IconFont.icon_arrow_lift,
              color: Colors.black,
              size: ScreenUtil().setSp(60),
            ),
            onPressed: () {
              NavigatorUtils.goBack(context);
            },
          ),
          title: Container(
            child: TextField(
              controller: _textEditingController,
              autofocus: true,
              autocorrect: true,
              maxLines: 1,
              maxLength: 20,
              decoration: InputDecoration(
                  counterText: "",
                  hintText: "搜索文章...",
                  isDense: true,
                  hintStyle: TextStyle(
                    color: Color(0xff939496),
                    fontSize: ScreenUtil().setSp(28),
                  )
              ),
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Color(0xff262626)
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[

            ],
          ),
        )
    );
  }
}
