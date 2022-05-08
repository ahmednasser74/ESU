import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/features/student_data/presentation/controller/transcript_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TranscriptScreen extends GetView<TranscriptController> {
  const TranscriptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.transcript.tr)),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: Text('Download'),
      //   icon: const Icon(Icons.file_download),
      // ),
      body: SfPdfViewer.network(
        controller.pdfUrl,
        controller: controller.pdfViewerController,
        headers: controller.headers,
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.separated(
      //         itemCount: 10,
      //         padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
      //         separatorBuilder: (context, index) => SizedBox(height: 12.h),
      //         itemBuilder: (context, index) =>
      //             TranscriptItemWidget(index: index),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
