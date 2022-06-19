import 'package:dartz/dartz.dart';
import 'package:esu/features/student_data/data/models/response/attendance/attendance_response_model.dart';
import 'package:esu/features/student_data/domain/repository/student_data_repository.dart';

import '../../../../core/usecases/usecase.dart';

class AttendanceUseCase extends UseCase<
    Future<Either<String?, AttendanceResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  AttendanceUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, AttendanceResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getAttendance();
}
