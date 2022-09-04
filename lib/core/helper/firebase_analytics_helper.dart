import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsHelper {
  final FirebaseAnalytics _analyticsInstance = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getFirebaseAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analyticsInstance);

  void logEvent(String name, {Map<String, dynamic>? parameters}) => _analyticsInstance.logEvent(name: name, parameters: parameters);
}
