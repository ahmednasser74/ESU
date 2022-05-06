import 'package:boilerplate/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:boilerplate/features/auth/data/model/request/login/login_request_model.dart';
import 'package:boilerplate/features/auth/data/model/request/lookup/lookup_request_model.dart';
import 'package:boilerplate/features/auth/data/model/response/admission/admission_response_model.dart';
import 'package:boilerplate/features/auth/data/model/response/login/login_response_model.dart';
import 'package:boilerplate/features/auth/data/model/response/lookup/lookup_respone_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String?, LoginResponseModel>> login({
    required LoginRequestModel requestModel,
  });

  Future<Either<String?, AdmissionResponseModel>> admission({
    required AdmissionRequestModel requestModel,
  });

  Future<Either<String?, LookupResponseModel>> getLookup({
    required LookupRequestModel requestModel,
  });
}
