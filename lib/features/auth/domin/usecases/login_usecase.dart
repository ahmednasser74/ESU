import 'package:esu/features/auth/data/model/request/login/login_request_model.dart';
import 'package:esu/features/auth/data/model/response/login/login_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase extends UseCase<Future<Either<String?, LoginResponseModel>>,
    LoginRequestModel> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Either<String?, LoginResponseModel>> call({
    required LoginRequestModel params,
  }) =>
      authRepository.login(requestModel: params);
}
