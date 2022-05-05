import 'package:boilerplate/features/auth/data/model/request/login/login_request_model.dart';
import 'package:boilerplate/features/auth/data/model/response/login/login_response_model.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase
    extends UseCase<Future<LoginResponseModel>, LoginRequestModel> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<LoginResponseModel> call({required LoginRequestModel params}) async {
    return await authRepository.login(requestModel: params);
  }
}
