import 'package:esu/features/auth/data/model/request/forget_password/forget_password_request_model.dart';
import 'package:esu/features/auth/data/model/response/forget_password/forget_password_reponse_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ForgetPasswordUseCase extends UseCase<
    Future<Either<String?, ForgetPasswordResponseModel>>,
    ForgetPasswordRequestModel> {
  final AuthRepository authRepository;

  ForgetPasswordUseCase({required this.authRepository});

  @override
  Future<Either<String?, ForgetPasswordResponseModel>> call({
    required ForgetPasswordRequestModel params,
  }) =>
      authRepository.forgetPassword(requestModel: params);
}
