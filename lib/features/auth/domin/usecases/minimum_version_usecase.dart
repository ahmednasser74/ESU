import 'package:dartz/dartz.dart';
import 'package:esu/features/auth/data/model/response/minimum_version/minimum_version_response_model.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class MinimumVersionUseCase extends UseCase<
    Future<Either<String?, MinimumVersionResponseModel>>, NoParams> {
  final AuthRepository authRepository;

  MinimumVersionUseCase({required this.authRepository});

  @override
  Future<Either<String?, MinimumVersionResponseModel>> call({
    required NoParams params,
  }) =>
      authRepository.getMinimumVersion();
}
