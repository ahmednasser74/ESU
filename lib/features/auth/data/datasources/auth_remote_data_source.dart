import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/dio/dio_helper.dart';
import 'package:boilerplate/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:boilerplate/features/auth/data/model/request/login/login_request_model.dart';
import 'package:boilerplate/features/auth/data/model/request/lookup/lookup_request_model.dart';
import 'package:boilerplate/features/auth/data/model/response/admission/admission_response_model.dart';
import 'package:boilerplate/features/auth/data/model/response/login/login_response_model.dart';
import 'package:boilerplate/features/auth/data/model/response/lookup/lookup_respone_model.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({required LoginRequestModel requestModel});

  Future<AdmissionResponseModel> admission({
    required AdmissionRequestModel requestModel,
  });

  Future<LookupResponseModel> getLookup({
    required LookupRequestModel requestModel,
  });
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
    final response = await dioHelper.post(
      url: Endpoints.lookup,
      data: requestModel.toJson(),
    );
    final json = response.data;
    final data = LookupResponseModel.fromJson(json);
    return data;
  }
}
