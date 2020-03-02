import 'package:app/common/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppSearch extends StatelessWidget {
  final Function func;
  CustomAppSearch({Key key,this.func}):super(key:key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(10),
        bottom: ScreenUtil().setHeight(10)
      ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              IconFont.icon_search,
              color: Color(0xff999CA1),
              size: ScreenUtil().setSp(50),
            ),
            Text(
              "大家都在搜：java开发",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Color(0xff999CA1)
              ),
            )
          ],
        ),
        onTap: func,
      ),
      decoration: BoxDecoration(
        color: Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))
      ),
    );
  }
}
