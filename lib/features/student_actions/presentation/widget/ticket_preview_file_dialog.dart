import 'dart:io';

import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/ticket_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendFilePreviewDialog extends StatelessWidget {
  SendFilePreviewDialog({
    Key? key,
    required this.file,
  }) : super(key: key);
  final File file;

  final replyTEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: .30.sh,
          margin: const EdgeInsets.all(18),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              ListTile(
                dense: true,
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
                trailing: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.grey),
                ),
                title: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 24),
                  child: Center(
                    child: Text(
                      LocalizationKeys.sendFile.tr,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Column(
                children: [
                  Assets.icons.addFile.image(
                    width: .30.w,
                    height: .30.h,
                  ),
                  Text(
                    LocalizationKeys.pickedFile.tr,
                    style: const TextStyle(color: AppColors.primaryColor),
                  ),
                  Text(
                    file.path.split('/').last,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const Spacer(),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: TextFormField(
                    controller: replyTEC,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return LocalizationKeys.pleaseAddReply.tr;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: LocalizationKeys.addTitleWithFile.tr,
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Get.find<TicketDetailsController>().sendReply(
                              replyBody: replyTEC.text.trim(),
                              file: file,
                            );
                            Navigator.pop(context);
                          }
                        },
                        icon: Assets.icons.sendMessageIcon.svg(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
