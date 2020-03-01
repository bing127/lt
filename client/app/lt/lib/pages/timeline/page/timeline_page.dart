import 'package:app/widget/custom_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            CustomCircle(
              authorAvatar: "https://user-gold-cdn.xitu.io/2019/12/23/16f2eaec5cbcc964?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              authorName: "LinDaiDai_霖呆呆",
              grade: 6,
              work: "全干开发工程师",
              content: "做疫情假期最后一餐，明天上班了。第一次做椒盐九吐鱼（“潮汕忒鱼”），果然椒盐才是灵魂；糖醋里脊也挺不错的😃做了一个月的饭，发了三条沸点，祝大家开工大吉。",
            ),
            CustomCircle(
              authorAvatar: "https://user-gold-cdn.xitu.io/2020/2/27/17084afd08ba3bad?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              authorName: "科技新闻搬运工",
              grade: 1,
              work: "研发",
              content: "在日本小学生表示对停课“悲伤”后，日本小学生也开始用钉钉了",
              pic:[
                "https://user-gold-cdn.xitu.io/2020/3/1/17095375dba3283b?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1",
                "https://user-gold-cdn.xitu.io/2020/3/1/170953775fa67fbd?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1",
                "https://user-gold-cdn.xitu.io/2020/3/1/17095378ededfd67?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1",
                "https://user-gold-cdn.xitu.io/2020/3/1/1709537a5a48db6f?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1",
                "https://user-gold-cdn.xitu.io/2020/3/1/1709537b90119a97?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1",
                "https://user-gold-cdn.xitu.io/2020/3/1/1709537cae89486d?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1",
                "https://user-gold-cdn.xitu.io/2020/3/1/1709537e5a677393?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1",
                "https://user-gold-cdn.xitu.io/2020/3/1/1709537fa217699c?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1",
              ],
            ),
            CustomCircle(
              authorAvatar: "https://user-gold-cdn.xitu.io/2018/2/8/161744432a698e51?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              authorName: "UI志",
              grade: 2,
              work: "UI工程师",
              content: "精致 3D 场景设计，光影和细节处理的好棒！",
              pic: [
                "https://user-gold-cdn.xitu.io/2020/3/1/17095335a4b7f40f?imageView2/1/w/260/h/260/q/85/format/jpg/interlace/1"
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
