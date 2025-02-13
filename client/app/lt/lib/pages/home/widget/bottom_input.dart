import 'package:app/common/utils/toast.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomInput extends StatefulWidget {
  final Function confirm;
  final String hintText;
  final String confirmText;
  BottomInput({
    Key key,
    @required this.confirm,
    this.confirmText:"发布",
    this.hintText:"有何高见，说两句吧！"
  }):assert(confirm!=null),
    super(key:key);

  @override
  _BottomInputState createState() => _BottomInputState();
}

class _BottomInputState extends State<BottomInput> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.3),
      body: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(90),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "取消",
                        style: TextStyle(
                            color: Color(0xffA2A5AA),
                            fontSize: ScreenUtil().setSp(29)
                        ),
                      ),
                      onPressed: (){
                        _close(context);
                      },
                      padding: EdgeInsets.all(0),
                    ),
                    FlatButton(
                      textColor:Color(0xff0F82FF),
                      child: Text(
                        "${widget.confirmText}",
                        style: TextStyle(
                            color: Color(0xff4286F5),
                            fontSize: ScreenUtil().setSp(29)
                        ),
                      ),
                      onPressed: (){
                        String text = _textEditingController.text;
                        if(text.trim()!= null && text.trim().length>0){
                          widget.confirm(text);
                          _close(context);
                        } else {
                          Toast.show("内容不能为空");
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(30),
                    right: ScreenUtil().setWidth(30)
                ),
                color: Colors.white,
                height: ScreenUtil().setHeight(400),
                child: TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  autocorrect: true,
                  maxLines: null,
                  maxLength: 200,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: "${widget.hintText}",
                      isDense: true,
                      hintStyle: TextStyle(
                        color: Color(0xff939496),
                        fontSize: ScreenUtil().setSp(28),
                      )
                  ),
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      color: Color(0xff262626)
                  ),
                ),
              )
            ],
          )
      ),
    );
  }


  _close(BuildContext context){
    NavigatorUtils.goBack(context);
  }
}
