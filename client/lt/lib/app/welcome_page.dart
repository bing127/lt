import 'dart:async';

import 'package:app/routers/fluro_navigator.dart';
import 'package:app/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Timer _timer;
  int count = 6;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1),(Timer timer){
      if(count == 1){
        goToRoot();
        return;
      }
      setState(() {
        count -- ;
      });
    });
  }


  void goToRoot(){
    _timer.cancel();
    NavigatorUtils.push(context, Routes.home, clearStack: true,transition: TransitionType.fadeIn);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: ScreenUtil().setHeight(100),
              right: ScreenUtil().setWidth(50),
              child: PhysicalModel(
                color: Color.fromRGBO(0,0,0,.3),
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(50)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "跳过 ${count}s",
                        style: TextStyle(
                            color: Color(0xff111111),
                            fontSize: ScreenUtil().setSp(28)
                        ),
                      ),
                      padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(20),
                          right: ScreenUtil().setWidth(20)
                      ),
                      height: ScreenUtil().setHeight(60),
                    ),
                    onTap: (){
                      goToRoot();
                    },
                  ),
                )
              )
            )
          ],
        )
      ),
    );
  }
}