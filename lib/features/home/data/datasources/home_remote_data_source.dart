import 'package:esu/core/const/end_point.dart';
import 'package:esu/core/dio/dio_helper.dart';
import 'package:esu/core/models/response/generic_model.dart';
import 'package:esu/features/home/data/models/request/edit_profile_request_model.dart';
import 'package:esu/features/home/data/models/response/chec_profile_files/check_edit_profile_files_response_model.dart';
import 'package:esu/features/home/data/models/response/edit_profile/edit_profile_response_model.dart';
import 'package:esu/features/home/data/models/response/home/home_response_model.dart';
import 'package:esu/features/home/data/models/response/notification/notification_item_response_model.dart';
import 'package:esu/features/home/data/models/response/popular_question/popular_question_item_response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/request/moodle_login_request_model.dart';
import '../models/response/moodle_login/moodle_login_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<NotificationResponseModel> getNotifications();

  Future<PopularQuestionResponseModel> getPopularQuestion();

  Future<CheckEditProfileFilesResponseModel> checkEditProfileFiles();

  Future<MoodleLoginResponseModel> moodleLogin({required MoodleLoginRequestModel requestModel});

  Future<EditProfileResponseModel> editProfile({
    required EditProfileRequestModel requestModel,
  });

  Future<HomeResponseModel> getHomeData();

  Future<GenericResponseModel> markAllNotificationsAsRead();

  Future<GenericResponseModel> markSingleNotificationAsRead({required int id});
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  HomeRemoteDataSourceImp({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<NotificationResponseModel> getNotifications() async {
    final response = await dioHelper.get(
      url: Endpoints.notification,
    );
    return NotificationResponseModel.fromJson(response.data);
  }

  @override
  Future<GenericResponseModel> markAllNotificationsAsRead() async {
    final response = await dioHelper.post(
      url: Endpoints.markAllNotificationsAsRead,
    );
    return GenericResponseModel.fromJson(response.data);
  }

  @override
  Future<GenericResponseModel> markSingleNotificationAsRead({
    required int id,
  }) async {
    final response = await dioHelper.post(
      url: '${Endpoints.markNotificationAsRead}/$id',
    );
    return GenericResponseModel.fromJson(response.data);
  }

  @override
  Future<PopularQuestionResponseModel> getPopularQuestion() async {
    final response = await dioHelper.get(url: Endpoints.faq);
    return PopularQuestionResponseModel.fromJson(response.data);
  }

  @override
  Future<HomeResponseModel> getHomeData() async {
    final response = await dioHelper.get(
      url: Endpoints.home,
    );
    return HomeResponseModel.fromJson(response.data);
  }

  @override
  Future<CheckEditProfileFilesResponseModel> checkEditProfileFiles() async {
    final response = await dioHelper.get(url: Endpoints.checkFiles);
    return CheckEditProfileFilesResponseModel.fromJson(response.data);
  }

  @override
  Future<EditProfileResponseModel> editProfile({
    required EditProfileRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.editProfile,
      data: FormData.fromMap(await requestModel.toJson()),
    );
    return EditProfileResponseModel.fromJson(response.data);
  }

  @override
  Future<MoodleLoginResponseModel> moodleLogin({required MoodleLoginRequestModel requestModel}) async {
    final response = await dioHelper.post(
      url: Endpoints.moodleLogin,
      data: FormData.fromMap(await requestModel.toJson()),
    );
    return MoodleLoginResponseModel.fromJson(response.data);
  }
}
