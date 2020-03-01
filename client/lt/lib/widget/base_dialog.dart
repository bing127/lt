import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 自定义dialog的模板

class BaseDialog extends StatefulWidget {
  const BaseDialog({
    Key key,
    this.title,
    this.onPressed,
    this.hiddenTitle : false,
    @required this.child
  }) : super(key : key);

  final String title;
  final Function onPressed;
  final Widget child;
  final bool hiddenTitle;

  @override
  _BaseDialogState createState() => _BaseDialogState();
}

class _BaseDialogState extends State<BaseDialog> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold( //创建透明层
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      // 键盘弹出收起动画过渡
      body: AnimatedContainer(
          alignment: Alignment.center,
          height: MediaQuery
              .of(context)
              .size
              .height - MediaQuery
              .of(context)
              .viewInsets
              .bottom,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeInCubic,
          child: ScaleTransition(
            scale:_animationController,
            child:  Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(16)),
                ),
                width: ScreenUtil().setWidth(600),
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Offstage(
                      offstage: widget.hiddenTitle,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(16)),
                        child: Text(
                          widget.hiddenTitle ? "" : widget.title,
                          style: TextStyle(fontSize: ScreenUtil().setSp(35)),
                        ),
                      ),
                    ),
                    Flexible(child: widget.child),
                    SizedBox(height: ScreenUtil().setHeight(16),),
                    Divider(
                      height: 0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: ScreenUtil().setHeight(100),
                            child: FlatButton(
                              child: Text(
                                "取消",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(32)
                                ),
                              ),
                              textColor: Color(0xFF999999),
                              onPressed: (){
                                _animationController.reverse();
                                NavigatorUtils.goBack(context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(100),
                          width: 0.6,
                          child: const VerticalDivider(),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: ScreenUtil().setHeight(100),
                            child: FlatButton(
                              child: Text(
                                "确定",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(32)
                                ),
                              ),
                              textColor: Color(0xff0F82FF),
                              onPressed: (){
                                _animationController.reverse();
                                widget.onPressed();
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
            ),
          )
      ),
    );
  }


  @override
  void initState() {
    _animationController = AnimationController(duration:Duration(milliseconds:200),vsync:this);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

}



