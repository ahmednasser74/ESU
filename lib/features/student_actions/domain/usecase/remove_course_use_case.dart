import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/response/course_register/courses_registeration_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class RemoveCourseUseCase
    extends UseCase<Future<Either<String?, CourseRegisterResponseModel>>, int> {
  final StudentActionsRepository studentActionsRepository;

  RemoveCourseUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, CourseRegisterResponseModel>> call({
    required int params,
  }) async =>
      studentActionsRepository.removeCourse(courseId: params);
}
