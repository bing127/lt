import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "龙潭圈",
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
