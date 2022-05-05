import 'package:boilerplate/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:boilerplate/features/auth/data/model/request/login/login_request_model.dart';
import 'package:boilerplate/features/auth/data/model/response/admission/admission_response_model.dart';
import 'package:boilerplate/features/auth/data/model/response/login/login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login({
    required LoginRequestModel requestModel,
  });

  Future<AdmissionResponseModel> admission({
    required AdmissionRequestModel requestModel,
  });
}
