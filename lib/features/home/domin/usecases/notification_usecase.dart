import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/home/data/models/response/notification/notification_item_response_model.dart';
import 'package:boilerplate/features/home/domin/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetNotificationUseCase extends UseCase<
    Future<Either<String?, NotificationResponseModel>>, NoParams> {
  GetNotificationUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<String?, NotificationResponseModel>> call({
    required NoParams params,
  }) async =>
      await repository.getNotification();
}
