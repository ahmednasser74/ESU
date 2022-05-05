import 'package:boilerplate/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:boilerplate/features/auth/data/model/request/login/login_request_model.dart';
import 'package:boilerplate/features/auth/data/model/response/admission/admission_response_model.dart';
import 'package:boilerplate/features/auth/data/model/response/login/login_response_model.dart';

import '../../../../core/network/network_information.dart';
import '../../domin/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource userLocalDataSource;
  final AuthRemoteDataSource userRemoteDataSource;
  final NetworkInformation networkInformation;

  AuthRepositoryImp({
    required this.userLocalDataSource,
    required this.userRemoteDataSource,
    required this.networkInformation,
  });

  @override
  Future<AdmissionResponseModel> admission({
    required AdmissionRequestModel requestModel,
  }) async =>
      await userRemoteDataSource.admission(requestModel: requestModel);

  @override
  Future<LoginResponseModel> login({
    required LoginRequestModel requestModel,
  }) async {
    userLocalDataSource.saveUserToken('token');
    return await userRemoteDataSource.login(requestModel: requestModel);
  }
}
