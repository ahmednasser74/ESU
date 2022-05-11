import 'package:boilerplate/core/models/response/generic_model.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/home/domin/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class MarkSingleNotificationAsReadUseCase
    extends UseCase<Future<Either<String?, GenericResponseModel>>, int> {
  MarkSingleNotificationAsReadUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<String?, GenericResponseModel>> call({
    required int params,
  }) async =>
      await repository.markSingleNotificationAsRead(id: params);
}
