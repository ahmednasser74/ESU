import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/home/data/models/request/edit_profile_request_model.dart';
import 'package:esu/features/home/data/models/response/edit_profile/edit_profile_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:esu/features/home/data/models/response/moodle_login/moodle_login_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/request/moodle_login_request_model.dart';
import '../repositories/home_repository.dart';

@Injectable()
class MoodleLoginUseCase extends UseCase<Future<Either<String?, MoodleLoginResponseModel>>, MoodleLoginRequestModel> {
  MoodleLoginUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<String?, MoodleLoginResponseModel>> call({
    required MoodleLoginRequestModel params,
  }) async =>
      await repository.moodleLogin(requestModel: params);
}
