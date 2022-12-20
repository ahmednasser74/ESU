import 'package:esu/features/auth/data/model/response/forget_password/reset_password_reponse_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/forget_password/reset_password_request_model.dart';
import '../repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ResetPasswordUseCase extends UseCase<
    Future<Either<String?, ResetPasswordResponseModel>>,
    ResetPasswordRequestModel> {
  final AuthRepository authRepository;

  ResetPasswordUseCase({required this.authRepository});

  @override
  Future<Either<String?, ResetPasswordResponseModel>> call({
    required ResetPasswordRequestModel params,
  }) =>
      authRepository.resetPassword(requestModel: params);
}
