import 'dart:io';
import 'dart:math';

import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/utils/di.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:esu/features/auth/domin/usecases/register_fcm_token_usecase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../src/routes.dart';
import 'notification_data_model.dart';

class NotificationHelper {
  static final NotificationHelper _instance = NotificationHelper._();

  NotificationHelper._();

  static NotificationHelper get instance => _instance;

  late FirebaseMessaging messaging;
  Map<String, dynamic> notificationData = {};
  late String? userToken;

  Future<void> init() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    userToken = SharedPrefs.instance.getString(key: SharedPrefsKeys.token);
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
      (message) async => await _navigateFromNotification(message),
    );
  }

  void _listenOnMessageAndFireLocalNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      notificationData = event.data;
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
        // payload: event.data['route'],
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
    if (notificationData != {}) {
      final data = NotificationDataModel.fromJsom(notificationData);
      if (data.route != null && userToken != null) {
        Get.toNamed(data.route!);
      }
    }
  }

  Future<void> _navigateFromNotification(RemoteMessage message) async {
    if (message.data != {}) {
      final data = NotificationDataModel.fromJsom(message.data);
      if (data.route != null && userToken != null) {
        Get.toNamed(Routes.homeScreen);
        Get.toNamed(data.route!);
      }
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
