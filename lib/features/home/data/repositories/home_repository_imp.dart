import 'package:esu/core/models/response/generic_model.dart';
import 'package:esu/core/utils/di.dart';
import 'package:esu/features/home/data/datasources/home_remote_data_source.dart';
import 'package:esu/features/home/data/models/request/edit_profile_request_model.dart';
import 'package:esu/features/home/data/models/response/chec_profile_files/check_edit_profile_files_response_model.dart';
import 'package:esu/features/home/data/models/response/edit_profile/edit_profile_response_model.dart';
import 'package:esu/features/home/data/models/response/home/home_response_model.dart';
import 'package:esu/features/home/data/models/response/notification/notification_item_response_model.dart';
import 'package:esu/features/home/data/models/response/popular_question/popular_question_item_response_model.dart';
import 'package:esu/features/home/domin/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/dependencies/dependency_init.dart';
import '../../../../core/network/network_information.dart';

@Injectable(as: HomeRepository)
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

  @override
  Future<Either<String?, CheckEditProfileFilesResponseModel>>
      checkEditProfileFiles() {
    return _responseHandling<CheckEditProfileFilesResponseModel>(
      onSuccess: () async => await remoteDataSource.checkEditProfileFiles(),
    );
  }

  @override
  Future<Either<String?, EditProfileResponseModel>> editProfile({
    required EditProfileRequestModel requestModel,
  }) {
    return _responseHandling<EditProfileResponseModel>(
      onSuccess: () async => await remoteDataSource.editProfile(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, PopularQuestionResponseModel>> getPopularQuestion() {
    return _responseHandling<PopularQuestionResponseModel>(
      onSuccess: () async => await remoteDataSource.getPopularQuestion(),
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
    final isConnected = await di<NetworkInformation>().isConnected;
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
