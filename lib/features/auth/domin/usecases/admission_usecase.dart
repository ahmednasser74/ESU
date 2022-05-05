import 'package:boilerplate/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:boilerplate/features/auth/data/model/response/admission/admission_response_model.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class AdmissionUseCase
    extends UseCase<Future<AdmissionResponseModel>, AdmissionRequestModel> {
  final AuthRepository authRepository;

  AdmissionUseCase({required this.authRepository});

  @override
  Future<AdmissionResponseModel> call({
    required AdmissionRequestModel params,
  }) async =>
      await authRepository.admission(requestModel: params);
}
