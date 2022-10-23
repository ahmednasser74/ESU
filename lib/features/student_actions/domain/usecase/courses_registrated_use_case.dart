import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/response/course_register/courses_registeration_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class CoursesRegisteredUseCase extends UseCase<
    Future<Either<String?, CourseRegisterResponseModel>>, NoParams> {
  final StudentActionsRepository studentActionsRepository;

  CoursesRegisteredUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, CourseRegisterResponseModel>> call({
    required NoParams params,
  }) async =>
      studentActionsRepository.getRegisteredCourse();
}
