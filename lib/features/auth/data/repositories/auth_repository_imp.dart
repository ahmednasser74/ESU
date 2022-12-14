import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:esu/core/models/response/generic_model.dart';
import 'package:esu/core/utils/di.dart';
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
import 'package:injectable/injectable.dart';

import '../../../../core/dependencies/dependency_init.dart';
import '../../../../core/network/network_information.dart';
import '../../domin/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource userRemoteDataSource;

  AuthRepositoryImp({required this.userRemoteDataSource});

  @override
  Future<Either<String?, AdmissionResponseModel>> admission({
    required AdmissionRequestModel requestModel,
  }) {
    return _responseHandling<AdmissionResponseModel>(
      onSuccess: () async => await userRemoteDataSource.admission(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, LoginResponseModel>> login({
    required LoginRequestModel requestModel,
  }) {
    return _responseHandling<LoginResponseModel>(
      onSuccess: () async => await userRemoteDataSource.login(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, LookupResponseModel>> getLookup({
    required LookupRequestModel requestModel,
  }) {
    return _responseHandling<LookupResponseModel>(
      onSuccess: () async => await userRemoteDataSource.getLookup(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, ForgetPasswordResponseModel>> forgetPassword({
    required ForgetPasswordRequestModel requestModel,
  }) async {
    return _responseHandling<ForgetPasswordResponseModel>(
      onSuccess: () async => await userRemoteDataSource.forgetPassword(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, ResetPasswordResponseModel>> resetPassword({
    required ResetPasswordRequestModel requestModel,
  }) async {
    return _responseHandling<ResetPasswordResponseModel>(
      onSuccess: () async => await userRemoteDataSource.resetPassword(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, MinimumVersionResponseModel>> getMinimumVersion() async {
    return _responseHandling<MinimumVersionResponseModel>(
      onSuccess: () async => await userRemoteDataSource.getMinimumVersion(),
    );
  }

  @override
  Future<Either<String?, GenericResponseModel>> registerFcmToken({
    required FcmTokenRequestModel requestModel,
  }) {
    return _responseHandling<GenericResponseModel>(
      onSuccess: () async => await userRemoteDataSource.registerFcmToken(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, GenericResponseModel>> deleteFcmToken({
    required FcmTokenRequestModel requestModel,
  }) {
    return _responseHandling<GenericResponseModel>(
      onSuccess: () async => await userRemoteDataSource.deleteFcmToken(
        requestModel: requestModel,
      ),
    );
  }

  @override
  Future<Either<String?, GenericResponseModel>> deleteUserAccount() {
    return _responseHandling<GenericResponseModel>(
      onSuccess: () async => await userRemoteDataSource.deleteUserAccount(),
    );
  }
}

extension on AuthRepository {
  String onServerErrorBase(dynamic e) {
    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.response:
          Object? msg;
          msg = e.response?.data['error_msg'];
          msg ??= e.response?.data['message'];
          return msg ?? e.error;
        default:
          return e.error;
      }
    }
    return e;
  }

  Future<Either<String?, T>> _responseHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(Exception exception)? onOtherError,
  }) async {
    final isConnected = await di<NetworkInformation>().isConnected;
    if (isConnected) {
      try {
        final f = await onSuccess();
        return Right(f);
      } on Exception catch (e) {
        if (onOtherError != null) {
          final f = await onOtherError(e);
          return Left(f);
        }
        final f = onServerErrorBase(e);
        return Left(f);
      }
    } else {
      return const Left("No internet connection");
    }
  }
}
