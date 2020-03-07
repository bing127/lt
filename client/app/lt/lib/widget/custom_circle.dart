import 'package:app/widget/custom_text_overflow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircle extends StatelessWidget {
  final String authorName;
  final String authorAvatar;
  final int grade;
  final String work;
  final String content;
  final List<String> pic;

  CustomCircle({
    Key key,
    this.authorName,
    this.authorAvatar,
    this.grade:0,
    this.work,
    this.content,
    this.pic
  })  :super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          bottom: ScreenUtil().setHeight(20),
          right: ScreenUtil().setWidth(30),
          top: ScreenUtil().setHeight(20)
      ),
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(15)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage("$authorAvatar"),
            radius: ScreenUtil().setWidth(40),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(20),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "$authorName",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: ScreenUtil().setSp(28)
                      ),
                    ),
                    _grade('LV$grade'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(15)
                  ),
                  child: Text(
                    "$work",
                    style: TextStyle(
                      color: Color(0xffA7A7A7),
                      fontSize: ScreenUtil().setSp(26)
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil().setHeight(15)
                  ),
                  child: CustomTextOverflow(
                    title: "$content",
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: ScreenUtil().setSp(28),
                        height: ScreenUtil().setHeight(2.5)
                    ),
                  ),
                ),
                pic!= null ? Container(
                  margin: EdgeInsets.only(
                      top: ScreenUtil().setHeight(15)
                  ),
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: ScreenUtil().setWidth(10),
                        mainAxisSpacing: ScreenUtil().setWidth(10)
                      ),
                      itemCount: pic.length,
                      itemBuilder: (_,int index){
                        return _pic(pic[index]);
                      }
                  ),
                ) : SizedBox.shrink(),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "3分钟前",
                      style: TextStyle(
                        color: Color(0xffA8A8A8),
                        fontSize: ScreenUtil().setSp(28)
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          _itemFooter(
                            "ic_tab_comments_no_number_black",
                            23,
                            tap: (){
                              print("1");
                            }
                          ),
                          _itemFooter(
                              "ic_tab_praise__black_normal",
                              3,
                              tap: (){
                                print("2");
                              }
                          ),
                          _itemFooter(
                              "ic_toolbar_share_dark",
                              23,
                              tap: (){
                                print("3");
                              }
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
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

  Widget _pic(String url){
    return PhysicalModel(
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
    );
  }

  Widget _itemFooter(String icon,int total,{Function tap}){
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/icon/$icon.png",
                width: ScreenUtil().setWidth(40),
                height: ScreenUtil().setWidth(40),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              total > 0 ? Text(
                "$total",
                style: TextStyle(
                    color: Color(0xff262626),
                    fontSize: ScreenUtil().setSp(28)
                ),
              ) : SizedBox.shrink()
            ],
          ),
          onTap: tap,
        ),
      ),
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(20)
      ),
    );
  }
}
