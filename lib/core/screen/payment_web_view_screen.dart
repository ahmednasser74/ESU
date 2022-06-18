import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    Key? key,
    required this.url,
    this.onBackCallBack,
  }) : super(key: key);

  final String url;
  final VoidCallback? onBackCallBack;

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  late String token;

  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
    token = SharedPrefs.instance.getToken() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.payment.tr)),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'locale': Get.locale.toString()
        }.toString(),
        // zoomEnabled: true,
        // debuggingEnabled: true,
        // gestureNavigationEnabled: true,
        // onPageFinished: (url) {
        //   print('onPageFinished: $url');
        // },
        // onPageStarted: (url) {
        //   print('onPageStarted: $url');
        // },
        // onWebResourceError: (error) {
        //   print('onWebResourceError: $error');
        // },
        // onWebViewCreated: (controller) {
        //   print('onWebViewCreated: ${controller}');
        // },
        // userAgent: 'aaaa',
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Future.delayed(Duration.zero, () {
      if (widget.onBackCallBack != null) {
        widget.onBackCallBack?.call();
      }
    });
  }
}
