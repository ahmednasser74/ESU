import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/student_actions/data/models/response/available_course/available_course_response_model.dart';
import 'package:boilerplate/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';

class CoursesAvailableUseCase extends UseCase<
    Future<Either<String?, AvailableCoursesResponseModel>>, NoParams> {
  final StudentActionsRepository studentActionsRepository;

  CoursesAvailableUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, AvailableCoursesResponseModel>> call({
    required NoParams params,
  }) async =>
      studentActionsRepository.getAvailableCourse();
}
