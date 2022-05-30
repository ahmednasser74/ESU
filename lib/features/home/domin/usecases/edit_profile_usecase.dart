import 'package:boilerplate/core/models/response/generic_model.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/home/data/models/request/edit_profile_request_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/home_repository.dart';

class EditProfileUseCase extends UseCase<
    Future<Either<String?, GenericResponseModel>>, EditProfileRequestModel> {
  EditProfileUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<String?, GenericResponseModel>> call({
    required EditProfileRequestModel params,
  }) async =>
      await repository.editProfile(requestModel: params);
}
