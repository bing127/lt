import 'package:app/pages/home/home_router.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flustars/flustars.dart' show DayFormat, TimelineUtil;

class CustomItem extends StatelessWidget {
  /// 发布人昵称
  final String authorName;
  ///发布人头像
  final String authorAvatar;
  ///文章分类
  final String classify;
  ///文章标题
  final String title;
  ///文章简介
  final String briefIntroduction;
  ///发布时间
  final String date;
  ///文章缩略图
  final String thumbnail;
  ///点赞数
  final num likeNum;
  ///收藏数
  final num collectNum;
  ///评论数
  final num commentNum;


  CustomItem({
    Key key,
    this.authorName,
    this.authorAvatar,
    this.classify,
    this.title,
    this.briefIntroduction,
    this.date,
    this.thumbnail,
    this.likeNum,
    this.collectNum,
    this.commentNum,
  })  : assert(title != null),
        super(key: key);

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
              top: ScreenUtil().setHeight(30),
              right: ScreenUtil().setWidth(30)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(authorAvatar),
                        radius: ScreenUtil().setWidth(30),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(15)
                        ),
                        child: Text(
                          "$authorName",
                          style: TextStyle(
                              color: Color(0xff272727),
                              fontSize: ScreenUtil().setSp(30)
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: ScreenUtil().setWidth(150),
                      )
                    ],
                  ),
                  Text(
                    "$classify",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(26),
                        color: Color(0xffA8A8A8)
                    ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              color: Color(0xff2C2C2C),
                              fontSize: ScreenUtil().setSp(29),
                              fontWeight: FontWeight.w700,
                              height: ScreenUtil().setHeight(2.5)
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        Text(
                          briefIntroduction,
                          style: TextStyle(
                              color: Color(0xff2C2C2C),
                              fontSize: ScreenUtil().setSp(26),
                              height: ScreenUtil().setHeight(2.5)
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(15),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${_dateFormat(date)}",
                              style: TextStyle(
                                  color: Color(0xff9C9EA2),
                                  fontSize: ScreenUtil().setSp(26)
                              ),
                            ),
                            RichText(
                                text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                        "$likeNum点赞",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(26),
                                            color: Color(0xff9C9EA2)
                                        ),
                                      ),
                                      TextSpan(
                                        text: " · ",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(27),
                                            color: Color(0xff9C9EA2)
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        "$collectNum收藏",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(26),
                                            color: Color(0xff9C9EA2)
                                        ),
                                      ),
                                      TextSpan(
                                        text: " · ",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(26),
                                            color: Color(0xff9C9EA2)
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        "$commentNum评论",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(27),
                                            color: Color(0xff9C9EA2)
                                        ),
                                      ),
                                    ]))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: PhysicalModel(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          thumbnail,
                          width: ScreenUtil().setWidth(200),
                          height: ScreenUtil().setWidth(200),
                          fit: BoxFit.cover,
                        )
                    ),
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(30)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: (){
          NavigatorUtils.push(context, HomeRouter.detailPage);
        },
      ),
    );
  }

  String _dateFormat(String date){
    DateTime time = date != null ? DateTime.fromMillisecondsSinceEpoch(int.parse(date)) : DateTime.now();
    return TimelineUtil.formatByDateTime(time,dayFormat: DayFormat.Common);
  }
}
