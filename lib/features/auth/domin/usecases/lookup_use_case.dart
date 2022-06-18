import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/auth/data/model/request/lookup/lookup_request_model.dart';
import 'package:esu/features/auth/data/model/response/lookup/lookup_respone_model.dart';
import 'package:esu/features/auth/domin/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LookupUseCase extends UseCase<
    Future<Either<String?, LookupResponseModel>>, LookupRequestModel> {
  final AuthRepository authRepository;

  LookupUseCase({required this.authRepository});

  @override
  Future<Either<String?, LookupResponseModel>> call({
    required LookupRequestModel params,
  }) =>
      authRepository.getLookup(requestModel: params);
}
