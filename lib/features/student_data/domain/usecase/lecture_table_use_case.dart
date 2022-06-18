import 'package:esu/features/student_data/data/models/response/lecture_table/lecture_table_response_model.dart';
import 'package:esu/features/student_data/domain/repository/student_data_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class LectureTableUseCase extends UseCase<
    Future<Either<String?, LectureTableResponseModel>>, NoParams> {
  final StudentDataRepository studentDataRepository;

  LectureTableUseCase({required this.studentDataRepository});

  @override
  Future<Either<String?, LectureTableResponseModel>> call({
    required NoParams params,
  }) async =>
      studentDataRepository.getLectureTable();
}
