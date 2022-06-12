import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({
    Key? key,
    required this.paymentUrl,
    required this.onBackCallBack,
  }) : super(key: key);

  final String paymentUrl;
  final VoidCallback onBackCallBack;

  @override
  PaymentWebViewScreenState createState() => PaymentWebViewScreenState();
}

class PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.payment.tr)),
      body: WebView(
        initialUrl: widget.paymentUrl,
        javascriptMode: JavascriptMode.unrestricted,
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
      widget.onBackCallBack();
    });
  }
}
