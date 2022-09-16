import 'package:dio/dio.dart';
import 'package:esu/core/const/end_point.dart';
import 'package:esu/core/dio/dio_helper.dart';
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

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({required LoginRequestModel requestModel});

  Future<ForgetPasswordResponseModel> forgetPassword({
    required ForgetPasswordRequestModel requestModel,
  });

  Future<ResetPasswordResponseModel> resetPassword({
    required ResetPasswordRequestModel requestModel,
  });

  Future<AdmissionResponseModel> admission({
    required AdmissionRequestModel requestModel,
  });

  Future<LookupResponseModel> getLookup({
    required LookupRequestModel requestModel,
  });

  Future<MinimumVersionResponseModel> getMinimumVersion();

  Future<GenericResponseModel> registerFcmToken({
    required FcmTokenRequestModel requestModel,
  });

  Future<GenericResponseModel> deleteFcmToken({
    required FcmTokenRequestModel requestModel,
  });

  Future<GenericResponseModel> deleteUserAccount();
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  AuthRemoteDataSourceImp({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<LoginResponseModel> login({
    required LoginRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.login,
      data: requestModel.toJson(),
    );
    final json = response.data;
    final data = LoginResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<AdmissionResponseModel> admission({
    required AdmissionRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.admission,
      data: FormData.fromMap(await requestModel.toJson()),
    );
    final json = response.data;
    final data = AdmissionResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<LookupResponseModel> getLookup({
    required LookupRequestModel requestModel,
  }) async {
    final response = await dioHelper.get(
      url: Endpoints.lookup,
      queryParams: requestModel.toJson(),
    );
    final json = response.data;
    final data = LookupResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<ForgetPasswordResponseModel> forgetPassword({
    required ForgetPasswordRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.forgetPassword,
      data: requestModel.toJson(),
    );
    final json = response.data;
    final data = ForgetPasswordResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<ResetPasswordResponseModel> resetPassword({
    required ResetPasswordRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.resetPassword,
      data: requestModel.toJson(),
    );
    final json = response.data;
    final data = ResetPasswordResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<MinimumVersionResponseModel> getMinimumVersion() async {
    final response = await dioHelper.get(
      url: Endpoints.minimumVersion,
    );
    final json = response.data;
    final data = MinimumVersionResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<GenericResponseModel> registerFcmToken({
    required FcmTokenRequestModel requestModel,
  }) async {
    final response = await dioHelper.post(
      url: Endpoints.registerFcmToken,
      data: requestModel.toJson(),
    );
    final json = response.data;
    final data = GenericResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<GenericResponseModel> deleteFcmToken({
    required FcmTokenRequestModel requestModel,
  }) async {
    final response = await dioHelper.delete(
      url: Endpoints.deleteFcmToken,
      data: requestModel.toJson(),
    );
    final json = response.data;
    final data = GenericResponseModel.fromJson(json);
    return data;
  }

  @override
  Future<GenericResponseModel> deleteUserAccount() async {
    final response = await dioHelper.delete(url: Endpoints.deleteUserAccount);
    final json = response.data;
    final data = GenericResponseModel.fromJson(json);
    return data;
  }
}
