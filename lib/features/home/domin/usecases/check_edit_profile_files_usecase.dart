import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/home/data/models/response/chec_profile_files/check_edit_profile_files_response_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/home_repository.dart';

class CheckEditProfileFilesUseCase extends UseCase<
    Future<Either<String?, CheckEditProfileFilesResponseModel>>, NoParams> {
  CheckEditProfileFilesUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<String?, CheckEditProfileFilesResponseModel>> call({
    required NoParams params,
  }) async =>
      await repository.checkEditProfileFiles();
}
