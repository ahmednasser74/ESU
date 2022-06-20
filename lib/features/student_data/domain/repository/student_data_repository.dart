import 'package:dartz/dartz.dart';
import 'package:esu/features/student_data/data/models/response/access_to_moodle/access_to_moodle_response_model.dart';
import 'package:esu/features/student_data/data/models/response/attendance/attendance_response_model.dart';
import 'package:esu/features/student_data/data/models/response/finance/finance_response_model.dart';
import 'package:esu/features/student_data/data/models/response/invoice_pay/invoice_pay_response_model.dart';
import 'package:esu/features/student_data/data/models/response/letters/letters.dart';
import 'package:esu/features/student_data/data/models/response/plans_of_study/plan_of_study_response_model.dart';
import 'package:esu/features/student_data/data/models/response/schedule/schedule_response_model.dart';
import 'package:esu/features/student_data/data/models/response/transcript/transcript_response_model.dart';

import '../../data/models/response/lecture_table/lecture_table_response_model.dart';

abstract class StudentDataRepository {
  Future<Either<String?, LettersResponseModel>> getLetters();

  Future<Either<String?, StudyPlansResponseModel>> getStudyPlans();

  Future<Either<String?, FinanceResponseModel>> getFinance();

  Future<Either<String?, ScheduleResponseModel>> getSchedule();

  Future<Either<String?, LectureTableResponseModel>> getLectureTable();

  Future<Either<String?, AccessToMoodleResponseModel>> getAccessToMoodle();

  Future<Either<String?, AttendanceResponseModel>> getAttendance();

  Future<Either<String?, TranscriptResponseModel>> getTranscript();

  Future<Either<String?, InvoicePayResponseModel>> getPayInvoiceUrl({
    required int invoiceId,
  });
}
