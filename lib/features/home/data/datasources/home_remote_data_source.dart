import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/dio/dio_helper.dart';
import 'package:boilerplate/core/models/response/generic_model.dart';
import 'package:boilerplate/features/home/data/models/response/notification/notification_item_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<NotificationResponseModel> getNotifications();

  Future<GenericResponseModel> markAllNotificationsAsRead();

  Future<GenericResponseModel> markSingleNotificationAsRead({required int id});
}

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
}
