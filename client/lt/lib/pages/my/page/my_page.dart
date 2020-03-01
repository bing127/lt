import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
