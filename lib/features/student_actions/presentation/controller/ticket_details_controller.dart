import 'dart:io';

import 'package:esu/features/student_actions/data/models/request/ticket_details/ticket_details_request_model.dart';
import 'package:esu/features/student_actions/data/models/request/ticket_reply/ticket_reply_request_model.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_details/tickets_details_data_response_model.dart';
import 'package:esu/features/student_actions/domain/usecase/ticket_details_single_use_case.dart';
import 'package:esu/features/student_actions/domain/usecase/ticket_reply_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class TicketDetailsController extends GetxController
    with StateMixin<TicketDetailsDataResponseModel> {
  final TicketDetailsUseCase ticketDetailsUseCase;
  final TicketReplyUseCase ticketReplyUseCase;

  TicketDetailsController({
    required this.ticketDetailsUseCase,
    required this.ticketReplyUseCase,
  });

  late int ticketId;
  final scrollController = ScrollController();

  @override
  onInit() {
    super.onInit();
    ticketId = Get.arguments as int;
    _getTicketDetails(ticketId: ticketId);
  }

  void _getTicketDetails({required int ticketId}) async {
    change(null, status: RxStatus.loading());
    final response = await ticketDetailsUseCase(
      params: TicketDetailsRequestModel(ticketId: ticketId),
    );
    response.fold(
      (l) => change(null, status: RxStatus.error(l)),
      (r) {
        if (r.status) {
          change(r.data, status: RxStatus.success());
          if (r.data!.replies.isNotEmpty) {
            _scrollToBottom();
          }
        } else {
          change(null, status: RxStatus.error(r.message));
        }
      },
    );
  }

  void sendReply({
    required String replyBody,
    File? file,
  }) async {
    final requestModel = TicketReplyRequestModel(
      ticketId: ticketId,
      body: replyBody,
      file: file,
    );
    _sendReply(requestModel: requestModel);
  }

  void _sendReply({required TicketReplyRequestModel requestModel}) async {
    change(null, status: RxStatus.loading());
    final response = await ticketReplyUseCase(params: requestModel);
    response.fold(
      (l) => change(null, status: RxStatus.error(l)),
      (r) {
        if (r.status) {
          if (r.data!.replies.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(r.data, status: RxStatus.success());
            if (r.data!.replies.isNotEmpty) {
              _scrollToBottom();
            }
          }
        } else {
          change(null, status: RxStatus.error(r.message));
        }
      },
    );
  }

  void _scrollToBottom() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }
}
