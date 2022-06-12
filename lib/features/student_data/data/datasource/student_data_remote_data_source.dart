import 'package:boilerplate/core/const/end_point.dart';
import 'package:boilerplate/core/dio/dio_helper.dart';
import 'package:boilerplate/features/student_data/data/models/response/access_to_moodle/access_to_moodle_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/availability_term_registration/availability_term_registration_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/finance/finance_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/invoice_pay/invoice_pay_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/lecture_table/lecture_table_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/letters/letters.dart';
import 'package:boilerplate/features/student_data/data/models/response/plans_of_study/plan_of_study_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/schedule/schedule_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/term_register_pay_response_model/term_register_pay_response_model.dart';

abstract class StudentDataRemoteDataSource {
  Future<LettersResponseModel> getLetters();

  Future<StudyPlansResponseModel> getStudyPlans();

  Future<FinanceResponseModel> getFinance();

  Future<InvoicePayResponseModel> getPayInvoiceUrl({required int invoiceId});

  Future<ScheduleResponseModel> getSchedule();

  Future<LectureTableResponseModel> getLectureTable();

  Future<AccessToMoodleResponseModel> getAccessToMoodle();

  Future<TermRegisterPayResponseModel> termRegisterPay({required int termId});

  Future<AvailabilityTermRegistrationResponseModel>
      availabilityTermRegistration();
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

  @override
  Future<FinanceResponseModel> getFinance() async {
    final response = await dioHelper.get(url: Endpoints.finance);
    return FinanceResponseModel.fromJson(response.data);
  }

  @override
  Future<InvoicePayResponseModel> getPayInvoiceUrl({
    required int invoiceId,
  }) async {
    final response = await dioHelper.get(
      url: '${Endpoints.financePay}/$invoiceId',
    );
    return InvoicePayResponseModel.fromJson(response.data);
  }

  @override
  Future<AccessToMoodleResponseModel> getAccessToMoodle() async {
    final response = await dioHelper.get(url: Endpoints.accessToMoodle);
    return AccessToMoodleResponseModel.fromJson(response.data);
  }

  @override
  Future<LectureTableResponseModel> getLectureTable() async {
    final response = await dioHelper.get(url: Endpoints.lectureTable);
    return LectureTableResponseModel.fromJson(response.data);
  }

  @override
  Future<ScheduleResponseModel> getSchedule() async {
    final response = await dioHelper.get(url: Endpoints.schedule);
    return ScheduleResponseModel.fromJson(response.data);
  }

  @override
  Future<AvailabilityTermRegistrationResponseModel>
      availabilityTermRegistration() async {
    final response = await dioHelper.get(
      url: Endpoints.availabilityTermRegistration,
    );
    return AvailabilityTermRegistrationResponseModel.fromJson(response.data);
  }

  @override
  Future<TermRegisterPayResponseModel> termRegisterPay({
    required int termId,
  }) async {
    final response = await dioHelper.get(
      url: '${Endpoints.termRegisterPay}/$termId',
    );
    return TermRegisterPayResponseModel.fromJson(response.data);
  }
}
