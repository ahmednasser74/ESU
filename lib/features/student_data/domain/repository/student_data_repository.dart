import 'package:boilerplate/features/student_data/data/models/response/finance/finance_response_model.dart';
import 'package:boilerplate/features/student_data/data/models/response/invoice_pay/invoice_pay.dart';
import 'package:boilerplate/features/student_data/data/models/response/letters/letters.dart';
import 'package:boilerplate/features/student_data/data/models/response/plans_of_study/plan_of_study_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class StudentDataRepository {
  Future<Either<String?, LettersResponseModel>> getLetters();

  Future<Either<String?, StudyPlansResponseModel>> getStudyPlans();

  Future<Either<String?, FinanceResponseModel>> getFinance();

  Future<Either<String?, InvoicePayResponseModel>> getPayInvoiceUrl({
    required int invoiceId,
  });
}
