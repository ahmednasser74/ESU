import 'package:boilerplate/core/models/response/generic_model.dart';
import 'package:boilerplate/features/home/data/models/request/edit_profile_request_model.dart';
import 'package:boilerplate/features/home/data/models/response/chec_profile_files/check_edit_profile_files_response_model.dart';
import 'package:boilerplate/features/home/data/models/response/home/home_response_model.dart';
import 'package:boilerplate/features/home/data/models/response/notification/notification_item_response_model.dart';
import 'package:boilerplate/features/home/data/models/response/popular_question/popular_question_item_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<String?, NotificationResponseModel>> getNotification();

  Future<Either<String?, GenericResponseModel>> markAllNotificationsAsRead();

  Future<Either<String?, HomeResponseModel>> getHomeData();

  Future<Either<String?, GenericResponseModel>> markSingleNotificationAsRead({
    required int id,
  });

  Future<Either<String?, PopularQuestionResponseModel>> getPopularQuestion();

  Future<Either<String?, CheckEditProfileFilesResponseModel>>
      checkEditProfileFiles();

  Future<Either<String?, GenericResponseModel>> editProfile({
    required EditProfileRequestModel requestModel,
  });
}
