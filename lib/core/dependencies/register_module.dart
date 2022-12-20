// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:vocus/core/const/end_point.dart';
//
// @module
// abstract class RegisterModule {
//   // You can register named preemptive types like follows
//   @Named("BaseUrl")
//   String get baseUrl => Endpoints.baseUrl;
//
//   // url here will be injected
//   @Named('Dio')
//   @lazySingleton
//   Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url))
//     ..interceptors.addAll([
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         error: true,
//         compact: true,
//         maxWidth: 90,
//       ),
//     ]);
//
//   @Named('Interceptor')
//   @lazySingleton
//   Dio dioInterceptor(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
//
//   @lazySingleton
//   FirebaseMessaging firebaseMessaging() => FirebaseMessaging.instance;
// }
