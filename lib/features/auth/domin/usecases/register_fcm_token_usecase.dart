import 'package:esu/core/models/response/generic_model.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegisterFcmTokenUseCase extends UseCase<
    Future<Either<String?, GenericResponseModel>>, FcmTokenRequestModel> {
  final AuthRepository authRepository;

  RegisterFcmTokenUseCase({required this.authRepository});

  @override
  Future<Either<String?, GenericResponseModel>> call({
    required FcmTokenRequestModel params,
  }) =>
      authRepository.registerFcmToken(requestModel: params);
}
