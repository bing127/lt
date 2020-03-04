import 'package:app/routers/fluro_navigator.dart';
import 'package:flustars/flustars.dart' show DayFormat, TimelineUtil;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_router.dart';

class HotItem extends StatelessWidget {
  final String title;
  final String thumbnail;
  final String time;
  final int browseNum;
  final String author;
  final String username;
  final int no;

  HotItem({
    Key key,
    this.title,
    this.time,
    this.author,
    this.browseNum:0,
    this.thumbnail,
    this.username,
    this.no:0
  }):super(key:key);


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Material(
        color: Colors.white,
        child: InkWell(
            child: Container(
               padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  bottom: ScreenUtil().setHeight(30),
                  right: ScreenUtil().setWidth(30)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: ScreenUtil().setWidth(260),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "${ no <= 10 ? ' NO.$no ' : '' }",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(27),
                                        color: Color(0xffF95355),
                                        backgroundColor: Color(0xffFDEDEE),
                                      )
                                  ),
                                  TextSpan(
                                      text: "${ no <= 10 ? '   ' : '' }$title",
                                      style: TextStyle(
                                          color: Color(0xff2C2C2C),
                                          fontSize: ScreenUtil().setSp(29),
                                          fontWeight: FontWeight.w700,
                                          height: ScreenUtil().setHeight(2.5)
                                      ),
                                  )
                                ]),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(author),
                                      radius: ScreenUtil().setWidth(25),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(10),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "$username",
                                        style: TextStyle(
                                            color: Color(0xff9DA0A7),
                                            fontSize: ScreenUtil().setSp(25),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                width: ScreenUtil().setWidth(210),
                              ),
                              RichText(
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "${_dateFormat(time)}   ",
                                          style: TextStyle(
                                              color: Color(0xff9DA0A7),
                                              fontSize: ScreenUtil().setSp(25)
                                          )
                                      ),
                                      TextSpan(
                                        text: "$browseNum 热度",
                                        style: TextStyle(
                                            color: Color(0xff9DA0A7),
                                            fontSize: ScreenUtil().setSp(25)
                                        ),
                                      )
                                    ]),
                              )
                            ],
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(
                        right: ScreenUtil().setWidth(15)
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(230),
                    height: ScreenUtil().setWidth(260),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                      image: DecorationImage(
                        image: NetworkImage(
                            thumbnail,
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  )
                ],
              ),
          ),
          onTap: (){
              NavigatorUtils.push(context, HomeRouter.detailPage);
          },
       )
    );
  }

  String _dateFormat(String date){
    DateTime time = date != null ? DateTime.fromMillisecondsSinceEpoch(int.parse(date)) : DateTime.now();
    return TimelineUtil.formatByDateTime(time,dayFormat: DayFormat.Common);
  }
}
