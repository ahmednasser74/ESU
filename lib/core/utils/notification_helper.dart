import 'dart:io';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final instance = NotificationHelper();

  Future<void> init() async {
    await Firebase.initializeApp();
    final messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();

    await FlutterLocalNotificationsPlugin().initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@drawable/launch_background'),
        iOS: IOSInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
        ),
      ),
      onSelectNotification: _onTapLocalNotification,
    );

    if (Platform.isAndroid) {
      _listenOnMessageAndFireLocalNotification();
    }

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    messaging.getToken().then((value) => debugPrint('getToken = $value'));
    messaging.getAPNSToken().then((value) => debugPrint('APNS TOKEN = $value'));
    messaging.onTokenRefresh.listen(
      (event) => debugPrint('onTokenRefresh = $event'),
    );
    FirebaseMessaging.onBackgroundMessage(
      (message) async => await _firebaseMessagingBackgroundHandler(
        message: message,
      ),
    );
  }

  void _listenOnMessageAndFireLocalNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      debugPrint("onMessage recieved");
      debugPrint('title = ${event.notification!.title}');
      debugPrint('body = ${event.notification!.body}');
      debugPrint('data = ${event.data.toString()}');
      await FlutterLocalNotificationsPlugin().show(
        Random().nextInt(100),
        event.notification!.title,
        event.notification!.body,
        NotificationDetails(
          android: const AndroidNotificationDetails(
            'default_notification_channel',
            'Basic Notifications',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ESU Notification',
          ),
          iOS: IOSNotificationDetails(
            presentSound: true,
            presentBadge: true,
            presentAlert: true,
            badgeNumber: Random().nextInt(100),
          ),
        ),
        payload: event.data['id'],
      );
    });
  }

  Future<void> setupOnMessageOpenedApp() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      await _navigateFromNotification(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_navigateFromNotification);
  }

  void _onTapLocalNotification(String? payload) {
    debugPrint('payload= $payload');
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    // final controller = Get.find<NewsDetailsController>();
    // controller.getNewsDetails(int.parse(payload!));
    // Get.to(
    //       () => const NewsScreen(),
    // );
  }

  Future<void> _firebaseMessagingBackgroundHandler({
    required RemoteMessage message,
  }) async {
    _navigateFromNotification(message);
  }

  Future<void> _navigateFromNotification(RemoteMessage message) async {
    if (message.data != {} && message.data.containsKey('id')) {
      dynamic id = message.data['id'];
      // final controller = Get.find<NewsDetailsController>();
      // await controller.getNewsDetails(int.parse(id));
      // Get.to(
      //       () => const NewsScreen(),
      // );
    }
  }

  Future<void> removeInitOfNotification() async =>
      await FirebaseMessaging.instance.deleteToken();
}
//flutter: APNS TOKEN = 9F2CB454D539E6C7E2791EB4D81D6FC46484789BBCE64DA6280D25A4F57DBFD2
// flutter: getToken = fV8uoU6N5kyqrTHL_HgYDk:APA91bG4j3Qa0_wIrADbV41_iSwZI80xrbD5FhRmgoRtj2n6rV9DKSKgkehGg4al_xt5p64VTROSjPnJ5aJGmSi3i8nizTEVQGdnmsOQquwuEn4Iyk-feRlQa0zhrd9hYAkCWMFG_B93
