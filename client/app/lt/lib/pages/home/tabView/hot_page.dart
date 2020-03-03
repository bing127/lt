import 'package:app/pages/home/widget/hot_item.dart';
import 'package:flutter/material.dart';

class HotPage extends StatefulWidget {
  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage>  with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            HotItem(
              title: "前端工程师的自我修养-关于 Babel 那些事儿",
              author:"https://user-gold-cdn.xitu.io/2019/3/7/16956cee70a4bd79?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/2/26/17080b06b0d072de?imageView2/0/w/1280/h/960/format/webp/ignore-error/1",
              username: "老司机iOS周报老司机iOS周报",
              time: "1583247765000",
              browseNum: 20,
              no: 1,
            ),
            HotItem(
              title: "老司机 iOS 周报 #103 | 2020-03-02",
              author:"https://user-gold-cdn.xitu.io/2019/3/7/16956cee70a4bd79?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/2/1709a513702321b4?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "老司机iOS周报老司机iOS周报",
              time: "1583248482000",
              browseNum: 3210,
              no: 2,
            ),
            HotItem(
              title: "抖音BoostMultiDex优化实践：Android低版本上APP首次启动时间减少80%",
              author:"https://user-gold-cdn.xitu.io/2018/7/16/164a1386a8b82dbd?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095bc924f75558?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "字节跳动技术团队",
              time: "1583116458000",
              browseNum: 23,
              no: 3,
            ),
            HotItem(
              title: "Android 事件分发之追本溯源",
              author:"https://user-gold-cdn.xitu.io/2019/12/28/16f4a4cce392c553?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095b5066cc421b?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "Amter",
              time: "1583030930000",
              browseNum: 12,
              no: 4,
            ),
            HotItem(
              title: "抖音BoostMultiDex优化实践：Android低版本上APP首次启动时间减少80%",
              author:"https://user-gold-cdn.xitu.io/2018/7/16/164a1386a8b82dbd?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095bc924f75558?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "字节跳动技术团队",
              time: "1583116458000",
              browseNum: 23,
              no: 5,
            ),
            HotItem(
              title: "抖音BoostMultiDex优化实践：Android低版本上APP首次启动时间减少80%",
              author:"https://user-gold-cdn.xitu.io/2018/7/16/164a1386a8b82dbd?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095bc924f75558?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "字节跳动技术团队",
              time: "1583116458000",
              browseNum: 23,
              no: 6,
            ),
            HotItem(
              title: "抖音BoostMultiDex优化实践：Android低版本上APP首次启动时间减少80%",
              author:"https://user-gold-cdn.xitu.io/2018/7/16/164a1386a8b82dbd?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095bc924f75558?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "字节跳动技术团队",
              time: "1583116458000",
              browseNum: 23,
              no: 7,
            ),
            HotItem(
              title: "抖音BoostMultiDex优化实践：Android低版本上APP首次启动时间减少80%",
              author:"https://user-gold-cdn.xitu.io/2018/7/16/164a1386a8b82dbd?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095bc924f75558?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "字节跳动技术团队",
              time: "1583116458000",
              browseNum: 23,
              no: 8,
            ),
            HotItem(
              title: "抖音BoostMultiDex优化实践：Android低版本上APP首次启动时间减少80%",
              author:"https://user-gold-cdn.xitu.io/2018/7/16/164a1386a8b82dbd?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095bc924f75558?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "字节跳动技术团队",
              time: "1583116458000",
              browseNum: 23,
              no: 9,
            ),
            HotItem(
              title: "抖音BoostMultiDex优化实践：Android低版本上APP首次启动时间减少80%",
              author:"https://user-gold-cdn.xitu.io/2018/7/16/164a1386a8b82dbd?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095bc924f75558?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "字节跳动技术团队",
              time: "1583116458000",
              browseNum: 23,
              no: 10,
            ),
            HotItem(
              title: "抖音BoostMultiDex优化实践：Android低版本上APP首次启动时间减少80%",
              author:"https://user-gold-cdn.xitu.io/2018/7/16/164a1386a8b82dbd?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/3/1/17095bc924f75558?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              username: "字节跳动技术团队",
              time: "1583116458000",
              browseNum: 23,
              no: 11,
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
