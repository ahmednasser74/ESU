import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/dio/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/app_interceptor.dart';

typedef RequestCallback = Future<Map<String, dynamic>> Function();
typedef ResponseCallback = Future<void> Function(Response);
typedef ErrorCallback = Future<void> Function(DioError);

class DioImpl extends DioHelper {
  final RequestCallback? onRequest;
  final ResponseCallback? onResponse;
  final ErrorCallback? onError;

  final String baseURL;
  late Dio _client;

  DioImpl({
    required this.baseURL,
    this.onResponse,
    this.onRequest,
    this.onError,
  }) {
    _client = Dio()
      ..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
        AppInterceptors(
          onRequest,
          onResponse,
          onError,
        ),
      ])
      ..options.baseUrl = baseURL
      ..options.headers.addAll({
        'Accept': 'application/json',
        'locale': SharedPrefs.instance.getString(key: SharedPrefsKeys.language) ?? 'ar',
      });
  }

  @override
  Future<Response<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) =>
      _client.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: {'locale': SharedPrefs.instance.getString(key: SharedPrefsKeys.language) ?? 'ar'},
        ),
      );

  @override
  Future<Response<T>> post<T>({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) =>
      _client.post(
        url,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: {'locale': SharedPrefs.instance.getString(key: SharedPrefsKeys.language) ?? 'ar'},
        ),
      );

  @override
  Future<Response<T>> put<T>({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) =>
      _client.put(
        url,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: {'locale': SharedPrefs.instance.getString(key: SharedPrefsKeys.language) ?? 'ar'},
        ),
      );

  @override
  Future<Response<T>> delete<T>({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) =>
      _client.delete(
        url,
        data: data,
        queryParameters: queryParams,
        options: Options(
          headers: {'locale': SharedPrefs.instance.getString(key: SharedPrefsKeys.language) ?? 'ar'},
        ),
      );
}
