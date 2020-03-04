import 'package:app/pages/home/widget/column_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnPage extends StatefulWidget {
  @override
  _ColumnPageState createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(20)
          ),
          children: <Widget>[
            ColumnItem(
                authorName: "蚂蚁金服科技",
                authorAvatar: "https://mirror-gold-cdn.xitu.io/168e091faa206f6faa0?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
                title:"Ant Design 4.0正式发布：创造快乐工作",
                grade:3,
                thumbnail:"https://user-gold-cdn.xitu.io/2020/3/3/1709fb36eca52b43?imageView2/0/w/1280/h/960/format/webp/ignore-error/1",
                time:"1583030930000"
            ),
            ColumnItem(
                authorName: "图雀社区",
                authorAvatar: "https://user-gold-cdn.xitu.io/2019/9/22/16d596f04f4f4e3d?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
                title:"从零到部署：用 Vue 和 Express 实现迷你全栈电商应用",
                grade:1,
                thumbnail:"https://user-gold-cdn.xitu.io/2020/3/3/1709e10992ad6025?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
                time:"1583171371000"
            ),
            ColumnItem(
                authorName: "chenhongdong",
                authorAvatar: "https://mirror-gold-cdn.xitu.io/168e083b4551b770de1?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
                title:"Webpack优化总会让你不得不爱",
                grade:5,
                thumbnail:"https://user-gold-cdn.xitu.io/2020/2/28/17089e049ce886fc?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
                time:"1583089309000"
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
