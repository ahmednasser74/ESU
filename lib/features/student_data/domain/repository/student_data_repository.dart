import 'package:boilerplate/features/student_data/data/models/response/letters/letters.dart';
import 'package:boilerplate/features/student_data/data/models/response/plans_of_study/plan_of_study_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class StudentDataRepository {
  Future<Either<String?, LettersResponseModel>> getLetters();
  Future<Either<String?, StudyPlansResponseModel>> getStudyPlans();
}
