import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/dio/dio_helper.dart';
import 'package:boilerplate/features/student_data/data/models/response/letters/letters.dart';
import 'package:boilerplate/features/student_data/data/models/response/plans_of_study/plan_of_study_response_model.dart';

abstract class StudentDataRemoteDataSource {
  Future<LettersResponseModel> getLetters();

  Future<StudyPlansResponseModel> getStudyPlans();
}

class StudentDataRemoteDataSourceImp implements StudentDataRemoteDataSource {
  StudentDataRemoteDataSourceImp({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<LettersResponseModel> getLetters() async {
    final response = await dioHelper.get(url: Endpoints.letters);
    return LettersResponseModel.fromJson(response.data);
  }

  @override
  Future<StudyPlansResponseModel> getStudyPlans() async {
    final response = await dioHelper.get(url: Endpoints.planOfStudy);
    return StudyPlansResponseModel.fromJson(response.data);
  }
}
