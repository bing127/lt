import 'package:app/common/icon.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
            "编辑",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(36)
            ),
          ),
        )
    );
  }
}
