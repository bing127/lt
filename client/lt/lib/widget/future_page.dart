import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class FuturePage extends StatelessWidget {
  const FuturePage({
    Key key,
    this.future,
    this.builder,
    this.hintText:'正在加载中...',
    this.showTap:false,
    this.showWidget:true,
    this.tap,
    this.height:double.infinity,
    this.customNoDataWidget
  }):super(key:key);
  final Future future;
  final String hintText;
  final Function builder;
  final bool showTap;
  final bool showWidget;
  final double height;
  final GestureTapCallback tap;
  final Widget customNoDataWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return  Container(
                width: double.infinity,
                height: double.infinity,
                color:const Color.fromRGBO(255,255,255,1),
                child: Center(
                  child: Container(
                    width: 200.0,
                    decoration:const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:const BorderRadius.all(Radius.circular(8.0))
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/space_no_auth.png',
                          width: 50,
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        const Text('请连接网络~', style: const TextStyle(color: Colors.black26),),
                        showTap ? Container(
                          margin: EdgeInsets.only(
                              top: 10
                          ),
                          child: FlatButton(
                            child:const Text(
                              "重新加载",
                              style: TextStyle(
                                  fontSize: 14
                              ),
                            ),
                            color:const Color(0xff0F82FF),
                            textColor:Colors.white,
                            onPressed: tap,
                          ),
                        ) :const SizedBox()
                      ],
                    ),
                  ),
                ),
              );
            case ConnectionState.waiting:
              return Container(
                width: double.infinity,
                color:const Color.fromRGBO(255,255,255,1),
                child: Center(
                  child: Container(
                    height: 120.0,
                    width: 120.0,
                    decoration:const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0))
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Theme(
                          data: ThemeData(
                              cupertinoOverrideTheme: CupertinoThemeData(
                                  brightness: Brightness.dark
                              )
                          ),
                          child: const CupertinoActivityIndicator(radius: 16.0),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Text(hintText, style: const TextStyle(color: Colors.black26),)
                      ],
                    ),
                  ),
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasError){
                return showWidget ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color:const Color.fromRGBO(255,255,255,1),
                  child: Center(
                    child: Container(
                      width: 200.0,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:const BorderRadius.all(Radius.circular(8.0))
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/space_no_auth.png',
                            width: 50,
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Text('加载失败...', style: const TextStyle(color: Colors.black26),),
                          showTap ? Container(
                            margin: EdgeInsets.only(
                                top: 10
                            ),
                            child: FlatButton(
                              child: Text(
                                "重新加载",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              ),
                              color: Color(0xff0F82FF),
                              textColor: Colors.white,
                              onPressed: tap,
                            ),
                          ) : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ) : SizedBox();
              }
              if(snapshot.hasData && snapshot.data!= null){
                 return builder(snapshot.data);
              } else{
                return showWidget ? (  customNoDataWidget!= null ? customNoDataWidget : Container(
                  width: double.infinity,
                  height: double.infinity,
                  color:const Color.fromRGBO(255,255,255,1),
                  child: Center(
                    child: Container(
                      width: 200.0,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:const BorderRadius.all(Radius.circular(8.0))
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/space_no_auth.png',
                            width: 50,
                          ),
                         const SizedBox(
                            height: 13,
                          ),
                          Text('暂无数据...', style: const TextStyle(color: Colors.black26),),
                          showTap ? Container(
                            margin: EdgeInsets.only(
                                top: 10
                            ),
                            child: FlatButton(
                              child:const Text(
                                "重新加载",
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              ),
                              color:const Color(0xff0F82FF),
                              textColor: Colors.white,
                              onPressed: tap,
                            ),
                          ) :const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ) ) :const SizedBox();
              }
              break;
            default:
              return null;
          }
        }
    );
  }
}
