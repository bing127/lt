import 'package:app/pages/home/home_router.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart' show DayFormat, TimelineUtil;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnItem extends StatelessWidget {
  final String authorName;
  final String authorAvatar;
  final String title;
  final String thumbnail;
  final int grade;
  final String time;

  ColumnItem({
    Key key,
    this.authorName,
    this.authorAvatar,
    this.time,
    this.title,
    this.thumbnail,
    this.grade:0
  })  : super(key: key);


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                top: ScreenUtil().setHeight(20),
                right: ScreenUtil().setWidth(30)
            ),
            child: PhysicalModel(
              color: Colors.white,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(authorAvatar),
                              radius: ScreenUtil().setWidth(30),
                            ),
                            Container(
                              height: ScreenUtil().setWidth(60),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(15)
                              ),
                              child: Text(
                                "$authorName",
                                style: TextStyle(
                                    color: Color(0xff272727),
                                    fontSize: ScreenUtil().setSp(28)
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            _grade('LV$grade'),
                          ],
                        ),
                        Text(
                          "${_dateFormat(time)}",
                          style: TextStyle(
                              color: Color(0xff9DA0A7),
                              fontSize: ScreenUtil().setSp(26)
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: "$thumbnail",
                        placeholder: (context, url) => new CircularProgressIndicator(),
                        errorWidget: (context, url, error) => new Icon(Icons.error),
                        height: ScreenUtil().setHeight(350),
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 0,
                        height: ScreenUtil().setHeight(80),
                        left: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(20),
                              right: ScreenUtil().setWidth(20)
                          ),
                          color: Color.fromRGBO(0,0,0,.5),
                          child: Text(
                            "$title",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(26),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ),
          onTap: (){
            NavigatorUtils.push(context, HomeRouter.detailPage);
          },
        )
    );
  }

  Widget _grade(String title){
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(10)
      ),
      child: Text(
        "$title",
        style: TextStyle(
            fontSize: ScreenUtil().setSp(23),
            color: Colors.white
        ),
      ),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(8),
          right: ScreenUtil().setWidth(8),
          top: ScreenUtil().setWidth(2),
          bottom: ScreenUtil().setWidth(2)
      ),
      decoration: BoxDecoration(
          color: Color(0xff8FD8EE),
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3))
      ),
    );
  }

  String _dateFormat(String date){
    DateTime time = date != null ? DateTime.fromMillisecondsSinceEpoch(int.parse(date)) : DateTime.now();
    return TimelineUtil.formatByDateTime(time,dayFormat: DayFormat.Common);
  }
}
