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
    messaging.subscribeToTopic('all');
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/launch_background');
    const initializationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS,
    );
    await FlutterLocalNotificationsPlugin().initialize(
      initializationSettings,
      onSelectNotification: _onTapLocalNotification,
    );
    _listenOnMessageAndFireLocalNotification();

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    messaging.getToken().then((value) => debugPrint('getToken = $value'));
    messaging.onTokenRefresh.listen(
      (event) => debugPrint('onTokenRefresh = $event'),
    );
    messaging.getAPNSToken().then((value) => debugPrint('APNS TOKEN = $value'));
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

      final androidPlatformChannelSpecifics = AndroidNotificationDetails(
        event.messageId ?? '',
        'all',
        channelDescription: 'description',
        priority: Priority.high,
        importance: Importance.max,
      );
      const iosNotificationDetails = IOSNotificationDetails(
        presentSound: true,
        presentBadge: true,
        presentAlert: true,
        badgeNumber: 0,
      );
      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iosNotificationDetails,
      );
      await FlutterLocalNotificationsPlugin().show(
        0,
        event.notification!.title,
        event.notification!.body,
        platformChannelSpecifics,
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
