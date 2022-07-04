import 'package:esu/core/const/end_point.dart';
import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/student_data/presentation/controller/transcript_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TranscriptPdfWidget extends GetView<TranscriptController> {
  TranscriptPdfWidget({
    Key? key,
    required this.transcriptId,
  }) : super(key: key);

  final int transcriptId;
  final PdfViewerController pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.transcript.tr)),
      body: SfPdfViewer.network(
        '${Endpoints.baseUrl}transcript?registration_id=$transcriptId',
        controller: pdfViewerController,
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${SharedPrefs.instance.getString(key: SharedPrefsKeys.token)}',
        },
      ),
    );
  }
}
