import 'package:esu/features/student_data/data/models/response/access_to_moodle/access_to_moodle_response_model.dart';
import 'package:esu/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class AccessToMoodleUseCase extends UseCase<
    Future<Either<String?, AccessToMoodleResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  AccessToMoodleUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, AccessToMoodleResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getAccessToMoodle();
}
