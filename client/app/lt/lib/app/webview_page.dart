import 'dart:async';

import 'package:app/common/icon.dart';
import 'package:app/routers/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key key,
    @required this.url,
    this.title,
  }) : super(key: key);

  final String url;
  final String title;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _showProgress = true;

  @override
  Widget build(BuildContext context) {
//    print("链接：${  widget.url }");
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (context, snapshot) {
          return WillPopScope(
            onWillPop: () async {
              if (snapshot.hasData) {
                bool canGoBack = await snapshot.data.canGoBack();
                if (canGoBack) {
                  // 网页可以返回时，优先返回上一页
                  snapshot.data.goBack();
                  return Future.value(false);
                }
                return Future.value(true);
              }
              return Future.value(true);
            },
            child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(
                      IconFont.ri_arrow_left_circle_line,
                      color: Colors.black,
                      size: ScreenUtil().setSp(36),
                    ),
                    onPressed: () {
                      NavigatorUtils.goBack(context);
                    },
                  ),
                  backgroundColor: Colors.white,
                  title: Text(
                    "${widget.title}",
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: ScreenUtil().setSp(35),
                        fontWeight: FontWeight.w600),
                  ),
                  elevation: 0.0,
                  centerTitle: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(ScreenUtil().setHeight(10)),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: _progressView(),
                    ),
                  ),
                ),
                body: SafeArea(
                    child: WebView(
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  javascriptChannels: <JavascriptChannel>[
                    _jsBridge(context) // 与h5 通信
                  ].toSet(),
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                  onPageStarted: (val) {
                    setState(() {
                      _showProgress = true;
                    });
                  },
                  onPageFinished: (val) {
                    setState(() {
                      _showProgress = false;
                    });
                  },
                ))),
          );
        });
  }

  JavascriptChannel _jsBridge(BuildContext context) => JavascriptChannel(
      name: 'fsOiApp', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async {
        print(message.message);
      });

  Widget _progressView() {
    return _showProgress
        ? SizedBox(
            child: LinearProgressIndicator(
              backgroundColor: Color(0xff0f82ff).withOpacity(.3),
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff0f82ff)),
            ),
            height: ScreenUtil().setHeight(5),
          )
        : SizedBox.shrink();
  }
}
