import 'package:boilerplate/features/student_data/data/models/response/letters.dart';
import 'package:dartz/dartz.dart';

abstract class StudentDataRepository {
  Future<Either<String?, LettersResponseModel>> getLetters();
}
