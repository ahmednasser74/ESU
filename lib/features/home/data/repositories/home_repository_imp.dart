import 'package:boilerplate/core/models/response/generic_model.dart';
import 'package:boilerplate/core/utils/di.dart';
import 'package:boilerplate/features/home/data/datasources/home_remote_data_source.dart';
import 'package:boilerplate/features/home/data/models/response/home/home_response_model.dart';
import 'package:boilerplate/features/home/data/models/response/notification/notification_item_response_model.dart';
import 'package:boilerplate/features/home/domin/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/network_information.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp({required this.remoteDataSource});

  final HomeRemoteDataSource remoteDataSource;

  @override
  Future<Either<String?, NotificationResponseModel>> getNotification() {
    return _responseHandling<NotificationResponseModel>(
      onSuccess: () async => await remoteDataSource.getNotifications(),
    );
  }

  @override
  Future<Either<String?, GenericResponseModel>> markAllNotificationsAsRead() {
    return _responseHandling<GenericResponseModel>(
      onSuccess: () async =>
          await remoteDataSource.markAllNotificationsAsRead(),
    );
  }

  @override
  Future<Either<String?, GenericResponseModel>> markSingleNotificationAsRead({
    required int id,
  }) {
    return _responseHandling<GenericResponseModel>(
      onSuccess: () async =>
          await remoteDataSource.markSingleNotificationAsRead(id: id),
    );
  }

  @override
  Future<Either<String?, HomeResponseModel>> getHomeData() {
    return _responseHandling<HomeResponseModel>(
      onSuccess: () async => await remoteDataSource.getHomeData(),
    );
  }
}

extension on HomeRepository {
  String onServerErrorBase(dynamic e) {
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.response:
          Object? msg;
          msg = e.response?.data['error_msg'];
          msg ??= e.response?.data['message'];
          return msg ?? e.error;
        default:
          return e.error;
      }
    }
    return e;
  }

  Future<Either<String?, T>> _responseHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(Exception exception)? onOtherError,
  }) async {
    final isConnected = await Injection.di<NetworkInformation>().isConnected;
    if (isConnected) {
      try {
        final f = await onSuccess();
        return Right(f);
      } on Exception catch (e) {
        if (onOtherError != null) {
          final f = await onOtherError(e);
          return Left(f);
        }
        final f = onServerErrorBase(e);
        return Left(f);
      }
    } else {
      return const Left("No internet connection");
    }
  }
}
