import 'package:app/widget/custom_item.dart';
import 'package:flutter/material.dart';

class FrontEndPage extends StatefulWidget {
  @override
  _FrontEndPageState createState() => _FrontEndPageState();
}

class _FrontEndPageState extends State<FrontEndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            CustomItem(
              authorAvatar: "https://leancloud-gold-cdn.xitu.io/b93c7966891b287e55a0.jpeg?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              authorName: "Tangpj",
              classify: "全栈",
              title: "2020年关于Android开发架构，我们还能做些什么？",
              briefIntroduction: "Android开发架构已经由由最最初的Activity架构（MVC），发展到到现在主流的MVP、MVVM架构了。社区也有不少优秀的实践。今天笔者想结合自己的经验谈一谈，一个合理的Android架构应该是怎么样的呢？",
              date: "1583026575000",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/2/9/170285ecb8159006?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              likeNum: 23,
              collectNum: 89,
              commentNum: 12,
            ),
            CustomItem(
              authorAvatar: "https://user-gold-cdn.xitu.io/2017/8/17/71d89b8dc97511de5d68ef26db778e10?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1",
              authorName: "CyJay",
              classify: "Flutter",
              title: "Flutter 实现类似美团外卖店铺页面滑动效果",
              briefIntroduction: "首先，我们看看目标和实现效果,实现效果,我这边是把放活动的地方放在了TabBar上方。至于为什么，哈哈，我怕麻烦，因为美团外卖的放活动的组件和下方商品的组件一并点菜、评价、商家页面的切换而消失，",
              date: "1581188197000",
              thumbnail: "https://user-gold-cdn.xitu.io/2020/2/9/17027dd714fa35a6?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1",
              likeNum: 36,
              collectNum: 7,
              commentNum: 1635,
            ),
            CustomItem(
              authorAvatar: "https://avatar-static.segmentfault.com/801/329/801329243-5d7773073dc10_big64",
              authorName: "徐九",
              classify: "随笔",
              title: "发明「复制粘贴」功能键的计算机工程师去世了，但他的成就远不止于此",
              briefIntroduction: "据外媒报道，著名计算机科学家和数学家拉里·特斯勒(Larry Tesler) 于当地时间 2 月 17 日去世，享年 74 岁。他是剪切、复制和粘贴功能的发明者，曾担任过苹果首席科学家。",
              date: "1583004975000",
              thumbnail: "https://segmentfault.com/img/bVbDTIS",
              likeNum: 12,
              collectNum: 3,
              commentNum: 1,
            ),
          ],
        ),
      ),
    );
  }
}
