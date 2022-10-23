import 'package:esu/features/student_data/data/models/response/plans_of_study/plan_of_study_response_model.dart';
import 'package:esu/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class StudyPlansUseCase extends UseCase<
    Future<Either<String?, StudyPlansResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  StudyPlansUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, StudyPlansResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getStudyPlans();
}
