import 'package:app/pages/model/swiper_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomSwiper extends StatelessWidget {

  final List<SwiperModel> pic;
  final double height;

  CustomSwiper({
    Key key,
    this.pic,
    this.height
  })  : assert(pic != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Container(
      height: height,
      child: new Swiper(
        autoplay: true,
        curve: Curves.linear,
        duration: 1000,
        itemBuilder: (BuildContext context,int index){
          return _swiperItem(pic[index].title,pic[index].img);
        },
        itemCount: pic.length,
        pagination: SwiperPagination(
            alignment: Alignment.topRight,
            builder: SwiperPagination.fraction
        ),
      ),
    );
  }


  Widget _swiperItem(String title,String img){
    return Stack(
      children: <Widget>[
        PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
          child: Container(
            child: CachedNetworkImage(
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
              imageUrl: img,
              height: height,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            height: height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 4,
                  color: Color.fromRGBO(0,0,0,.8),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0,0,0,.6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(ScreenUtil().setWidth(15)),
                bottomRight: Radius.circular(ScreenUtil().setWidth(15)),
              ),
            ),
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(20),
              bottom: ScreenUtil().setHeight(20),
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(20)
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(26)
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
