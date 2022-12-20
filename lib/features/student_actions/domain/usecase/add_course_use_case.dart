import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/request/add_course/add_course_request_model.dart';
import 'package:esu/features/student_actions/data/models/response/course_register/courses_registeration_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AddCoursesUseCase extends UseCase<
    Future<Either<String?, CourseRegisterResponseModel>>,
    AddCourseRequestModel> {
  final StudentActionsRepository studentActionsRepository;

  AddCoursesUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, CourseRegisterResponseModel>> call({
    required AddCourseRequestModel params,
  }) async =>
      studentActionsRepository.addCourse(requestModel: params);
}
