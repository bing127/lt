import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base_dialog.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String tips;
  final GestureTapCallback onTap;
  final Widget customChild;
  final bool hiddenTitle;

  CustomDialog({
    Key key,
    this.title,
    this.customChild,
    this.hiddenTitle = true,
    this.tips = "提示",
    this.onTap
  }) : super(key : key);
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return BaseDialog(
      title: "${widget.tips}",
      hiddenTitle: widget.hiddenTitle,
      child: widget.title!=null ? Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(15), vertical: ScreenUtil().setHeight(15)),
        child: Text("${widget.title}", style: TextStyle(fontSize: 18)),
      ) : widget.customChild,
      onPressed: (){
        NavigatorUtils.goBack(context);
        widget.onTap();
      },
    );
  }
}
