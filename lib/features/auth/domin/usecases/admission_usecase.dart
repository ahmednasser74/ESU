import 'package:esu/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:esu/features/auth/data/model/response/admission/admission_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

@Injectable()
class AdmissionUseCase extends UseCase<
    Future<Either<String?, AdmissionResponseModel>>, AdmissionRequestModel> {
  final AuthRepository authRepository;

  AdmissionUseCase({required this.authRepository});

  @override
  Future<Either<String?, AdmissionResponseModel>> call({
    required AdmissionRequestModel params,
  }) =>
      authRepository.admission(requestModel: params);
}
