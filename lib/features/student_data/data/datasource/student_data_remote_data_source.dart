import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/dio/dio_helper.dart';
import 'package:boilerplate/features/student_data/data/models/response/letters.dart';

abstract class StudentDataRemoteDataSource {
  Future<LettersResponseModel> getLetters();
}

class StudentDataRemoteDataSourceImp implements StudentDataRemoteDataSource {
  StudentDataRemoteDataSourceImp({required this.dioHelper});

  final DioHelper dioHelper;

  @override
  Future<LettersResponseModel> getLetters() async {
    final response = await dioHelper.get(url: Endpoints.letters);
    return LettersResponseModel.fromJson(response.data);
  }
}
