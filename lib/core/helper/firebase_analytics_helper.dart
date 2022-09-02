import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsHelper {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getFirebaseAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);
}
