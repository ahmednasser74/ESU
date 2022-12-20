import 'package:dartz/dartz.dart';
import 'package:esu/core/models/response/generic_model.dart';
import 'package:esu/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:esu/features/auth/data/model/request/forget_password/forget_password_request_model.dart';
import 'package:esu/features/auth/data/model/request/forget_password/reset_password_request_model.dart';
import 'package:esu/features/auth/data/model/request/login/login_request_model.dart';
import 'package:esu/features/auth/data/model/request/lookup/lookup_request_model.dart';
import 'package:esu/features/auth/data/model/response/admission/admission_response_model.dart';
import 'package:esu/features/auth/data/model/response/forget_password/forget_password_reponse_model.dart';
import 'package:esu/features/auth/data/model/response/forget_password/reset_password_reponse_model.dart';
import 'package:esu/features/auth/data/model/response/login/login_response_model.dart';
import 'package:esu/features/auth/data/model/response/lookup/lookup_respone_model.dart';
import 'package:esu/features/auth/data/model/response/minimum_version/minimum_version_response_model.dart';

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

  Future<Either<String?, ForgetPasswordResponseModel>> forgetPassword({
    required ForgetPasswordRequestModel requestModel,
  });

  Future<Either<String?, ResetPasswordResponseModel>> resetPassword({
    required ResetPasswordRequestModel requestModel,
  });

  Future<Either<String?, MinimumVersionResponseModel>> getMinimumVersion();

  Future<Either<String?, GenericResponseModel>> registerFcmToken({
    required FcmTokenRequestModel requestModel,
  });

  Future<Either<String?, GenericResponseModel>> deleteFcmToken({
    required FcmTokenRequestModel requestModel,
  });

  Future<Either<String?, GenericResponseModel>> deleteUserAccount();
}
