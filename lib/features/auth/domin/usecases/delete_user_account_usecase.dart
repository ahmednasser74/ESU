import 'package:esu/core/models/response/generic_model.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class DeleteUserAccountUseCase extends UseCase<Future<Either<String?, GenericResponseModel>>, NoParams> {
  final AuthRepository authRepository;

  DeleteUserAccountUseCase({required this.authRepository});

  @override
  Future<Either<String?, GenericResponseModel>> call({required NoParams params}) {
    return authRepository.deleteUserAccount();
  }
}
