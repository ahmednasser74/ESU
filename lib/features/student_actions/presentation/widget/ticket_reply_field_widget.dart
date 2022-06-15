import 'dart:io';

import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/file_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/ticket_details_controller.dart';
import 'package:boilerplate/features/student_actions/presentation/widget/ticket_preview_file_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketReplyFieldWidget extends StatefulWidget {
  const TicketReplyFieldWidget({Key? key, this.fileCallBack}) : super(key: key);
  final void Function(File?)? fileCallBack;

  @override
  State<TicketReplyFieldWidget> createState() => _TicketReplyFieldWidgetState();
}

class _TicketReplyFieldWidgetState extends State<TicketReplyFieldWidget>
    with FileProperties {
  final replyTEC = TextEditingController();
  late bool isWritingMessage;

  @override
  void initState() {
    isWritingMessage = replyTEC.text.trim().isNotEmpty;
    replyTEC.addListener(() {
      if (replyTEC.text.trim().isNotEmpty) {
        if (!isWritingMessage) {
          setState(() => isWritingMessage = true);
        }
      } else if (isWritingMessage) {
        setState(() => isWritingMessage = false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: replyTEC,
        decoration: InputDecoration(
          hintText: LocalizationKeys.writeReplyHere.tr,
          suffixIcon: IconButton(
            icon: !isWritingMessage
                ? Assets.icons.addFile.image(height: 18)
                : Assets.icons.sendMessageIcon.svg(
                    height: 18,
                    color: AppColors.primaryColor,
                  ),
            onPressed: () {
              if (isWritingMessage) {
                Get.find<TicketDetailsController>().sendReply(
                  replyBody: replyTEC.text.trim(),
                );
              } else {
                onTapPickFile();
              }
            },
          ),
        ),
        minLines: 1,
        maxLines: 5,
      ),
    );
  }

  Future<void> onTapPickFile() async {
    final file = await pickedFile();
    if (file != null) {
      widget.fileCallBack?.call(file);
      showDialog(
        context: context,
        builder: (dialogContext) => SendFilePreviewDialog(file: file),
      );
    }
  }
}
