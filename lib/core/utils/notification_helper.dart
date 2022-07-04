import 'dart:io';
import 'dart:math';

import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/utils/di.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:esu/features/auth/domin/usecases/register_fcm_token_usecase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final NotificationHelper _instance = NotificationHelper._();

  NotificationHelper._();

  static NotificationHelper get instance => _instance;

  late FirebaseMessaging messaging;

  Future<void> init() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
    Injection.di<FcmTokenUpdate>().onFcmTokenUpdate();
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
    FirebaseMessaging.onBackgroundMessage(
      (message) async => await _firebaseMessagingBackgroundHandler(
        message: message,
      ),
    );
  }

  void _listenOnMessageAndFireLocalNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
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
      // dynamic id = message.data['id'];
      // final controller = Get.find<NewsDetailsController>();
      // await controller.getNewsDetails(int.parse(id));
      // Get.to(
      //       () => const NewsScreen(),
      // );
    }
  }

  Future<void> removeToken() async => await messaging.deleteToken();

  Future<String> get getFcmToken async => await messaging.getToken() ?? '';
}

class FcmTokenUpdate {
  final RegisterFcmTokenUseCase registerFcmTokenUseCase;

  FcmTokenUpdate({required this.registerFcmTokenUseCase});

  void onFcmTokenUpdate() {
    final prefs = SharedPrefs.instance;
    if (prefs.getString(key: SharedPrefsKeys.token) != null) {
      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        final FcmTokenRequestModel requestModel = FcmTokenRequestModel(
          fcmToken: fcmToken,
          type: 'update',
        );
        registerFcmTokenUseCase(params: requestModel);
        prefs.saveString(key: SharedPrefsKeys.fcmToken, value: fcmToken);
      });
    }
  }
}
