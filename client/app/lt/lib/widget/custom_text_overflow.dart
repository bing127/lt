import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextOverflow extends StatefulWidget {
  final String title;
  final TextStyle style;
  final int max;
  const CustomTextOverflow({
    Key key,
    @required this.title,
    this.max:3,
    this.style,
  }):super(key:key);

  @override
  _CustomTextOverflowState createState() => _CustomTextOverflowState();
}

class _CustomTextOverflowState extends State<CustomTextOverflow> {
  bool _isOverflow = true;


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return _textView();
  }

  Widget _textView(){
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(text: widget.title ?? '', style: widget.style);
      final tp = TextPainter(text: span, maxLines: widget.max, textDirection: TextDirection.ltr);
      tp.layout(maxWidth: size.maxWidth);

      if (tp.didExceedMaxLines) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _isOverflow ? Text(widget.title ?? '', style: widget.style) :
            Text(widget.title ?? '', maxLines: widget.max,
                overflow: TextOverflow.ellipsis,
                style: widget.style
            ),
            InkWell(
              child: Container(
                width: ScreenUtil().setWidth(100),
                alignment: Alignment.centerLeft,
                child: Text(
                    "${ !_isOverflow ? '收起' : '展开' }",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color(0xff4286F5),
                    )
                ),
                padding: EdgeInsets.only(
                    right: ScreenUtil().setWidth(20),
                    top: ScreenUtil().setHeight(20),
                    bottom: ScreenUtil().setHeight(20)
                ),
              ),
              onTap: (){
                setState(() {
                  _isOverflow = _isOverflow ? false : true;
                });
              },
            )
          ],
        );
      } else {
        return Text(widget.title ?? '', style: widget.style);
      }
    });
  }
}
