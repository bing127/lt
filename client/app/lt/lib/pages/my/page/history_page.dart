import 'package:app/common/icon.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
            onPressed: (){
              NavigatorUtils.goBack(context);
            },
          ),
          title: Text(
            "浏览历史",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(36)
            ),
          ),
        )
    );
  }
}
