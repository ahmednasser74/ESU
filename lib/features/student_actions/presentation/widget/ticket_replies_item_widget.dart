import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/keep_live_widget.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/features/student_actions/data/models/response/tickets/tickets_data_replies_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/helper/file_download_helper/file_download_manager.dart';

class TicketRepliesItemWidget extends StatelessWidget {
  const TicketRepliesItemWidget({
    Key? key,
    required this.reply,
  }) : super(key: key);
  final TicketDataRepliesResponseModel reply;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: reply.isReplyFromStudent ? MainAxisAlignment.start : MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: reply.isReplyFromStudent ? Theme.of(context).colorScheme.secondary : Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: reply.isReplyFromStudent
                  ? Radius.zero
                  : Radius.circular(
                      8.r,
                    ),
              bottomEnd: reply.isReplyFromStudent
                  ? Radius.circular(
                      8.r,
                    )
                  : Radius.zero,
              topStart: Radius.circular(8.r),
              topEnd: Radius.circular(8.r),
            ),
          ),
          constraints: BoxConstraints(
            maxWidth: .75.sw,
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(reply.by, style: TextStyle(fontSize: 8.sp)),
              ),
              Html(
                data: reply.body,
                style: {'p': Style(fontSize: FontSize(12.sp))},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('E d MMM yyyy hh:mm aaa').format(
                      DateTime.parse(reply.createdAt),
                    ),
                    style: TextStyle(fontSize: 8.sp, color: Colors.black),
                  ),
                  ConditionalBuilder(
                    condition: reply.file!.isNotEmpty && reply.file!.startsWith('https:'),
                    builder: (_) => DownloadFileWidget(fileUrl: reply.file!),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DownloadFileWidget extends StatefulWidget {
  const DownloadFileWidget({Key? key, required this.fileUrl}) : super(key: key);
  final String fileUrl;

  @override
  State<DownloadFileWidget> createState() => _DownloadFileWidgetState();
}

class _DownloadFileWidgetState extends State<DownloadFileWidget> {
  late FileDownloadManager fileManager;
  int? progress;

  @override
  void initState() {
    super.initState();
    fileManager = FileDownloadManager(fileUrl: widget.fileUrl);
    checkExits();
    fileManager.events.listen((data) {
      String id = data[0].toString();
      if (fileManager.taskId == id) {
        int progress = data[2];
        setState(() {
          this.progress = progress;
        });
      }
    });
  }

  void checkExits() {
    final isExist = fileManager.checkFileExists();
    if (isExist) {
      setState(() => progress = 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ConditionalBuilder(
            condition: progress == null,
            builder: (_) => InkWell(
              onTap: () async {
                final status = await Permission.storage.request();
                if (status.isGranted) {
                  await fileManager.downloadFile();
                  HelperMethod.showSnackBar(
                    title: LocalizationKeys.done.tr,
                    message: LocalizationKeys.successfullyDownloadedFileOnYourDevice.tr,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  );
                  setState(() {});
                } else {
                  HelperMethod.showSnackBar(
                    title: LocalizationKeys.error.tr,
                    message: LocalizationKeys.shouldToGivePermissionToAccessFiles.tr,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              },
              child: const Icon(
                Icons.file_download_outlined,
                color: Colors.black,
              ),
            ),
            fallback: (_) => ConditionalBuilder(
              condition: progress == 100,
              builder: (_) => InkWell(
                onTap: () => fileManager.openFile(),
                child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: Row(
                    children: [
                      Text(
                        LocalizationKeys.openFile.tr,
                        style: TextStyle(fontSize: 10.sp, color: Colors.black),
                      ),
                      SizedBox(width: 4.r),
                      Icon(
                        Icons.file_present_rounded,
                        color: Colors.black,
                        size: 16.r,
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (_) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: 32,
                width: 32,
                child: Center(
                  child: Text(
                    '$progress%',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Visibility(
            visible: progress == null,
            child: Text(
              LocalizationKeys.downloadFile.tr,
              style: TextStyle(fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }
}
