import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/home/data/models/request/edit_profile_request_model.dart';
import 'package:esu/features/home/data/models/response/edit_profile/edit_profile_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repositories/home_repository.dart';

@Injectable()
class EditProfileUseCase extends UseCase<
    Future<Either<String?, EditProfileResponseModel>>,
    EditProfileRequestModel> {
  EditProfileUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<String?, EditProfileResponseModel>> call({
    required EditProfileRequestModel params,
  }) async =>
      await repository.editProfile(requestModel: params);
}
