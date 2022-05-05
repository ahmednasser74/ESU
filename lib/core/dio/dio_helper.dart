import 'package:dio/dio.dart';

abstract class DioHelper {
  Future<Response<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParams,
    Options? options,
  });

  Future<Response<T>> post<T>({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  });

  Future<Response<T>> delete<T>({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  });

  Future<Response<T>> put<T>({
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  });
}
