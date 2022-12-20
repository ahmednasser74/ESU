import 'dart:io';

import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/request/ticket_create/ticket_create_request_model.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_category/ticket_category_data_response_model.dart';
import 'package:esu/features/student_actions/domain/usecase/ticket_categories_use_case.dart';
import 'package:esu/features/student_actions/domain/usecase/ticket_create_use_case.dart';
import 'package:esu/features/student_actions/presentation/controller/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class TicketCreateController extends GetxController {
  final TicketCreateUseCase ticketCreateUseCase;
  final TicketCategoriesUseCase ticketCategoriesUseCase;

  TicketCreateController({
    required this.ticketCreateUseCase,
    required this.ticketCategoriesUseCase,
  });

  RxBool isLoading = RxBool(false);
  RxBool isError = RxBool(false);
  RxString errorMessage = RxString('');
  late TicketsCategoriesResponseModel ticketCategoriesResponseModel;
  final subjectTEC = TextEditingController();
  final bodyTEC = TextEditingController();
  File? pickedFile;
  late int categoryId;
  final formKey = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    _getCategories();
  }

  void _getCategories() async {
    isLoading.value = true;
    final response = await ticketCategoriesUseCase(params: NoParams());
    response.fold(
      (l) {
        isLoading.value = false;
        isError.value = true;
        errorMessage.value = l!;
      },
      (r) {
        if (r.status) {
          ticketCategoriesResponseModel = r;
        } else {
          isLoading.value = false;
          isError.value = true;
        }
      },
    );
    isLoading.value = false;
  }

  void ticketCreate({
    required String subject,
    required String body,
    required int categoryId,
    File? file,
  }) async {
    final requestModel = TicketCreateRequestModel(
      subject: subject,
      body: body,
      categoryId: categoryId,
      file: file,
    );
    _ticketCreate(requestModel: requestModel);
  }

  void _ticketCreate({required TicketCreateRequestModel requestModel}) async {
    isLoading.value = true;
    final response = await ticketCreateUseCase(params: requestModel);
    response.fold(
      (l) {
        isLoading.value = false;
        isError.value = true;
        errorMessage.value = l!;
      },
      (r) {
        if (r.status) {
          Get.back();
          Future.delayed(
            Duration.zero,
            () => Get.find<TicketsController>().getTickets(),
          );
        } else {
          isLoading.value = false;
          isError.value = true;
        }
      },
    );
    isLoading.value = false;
  }
}
