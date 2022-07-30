import 'package:esu/core/const/end_point.dart';
import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/file_helper/file_download_manager.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/utils/helper_methods.dart';

class LetterPdfViewerScreen extends StatefulWidget {
  const LetterPdfViewerScreen({
    Key? key,
    required this.id,
    required this.lang,
  }) : super(key: key);
  final int id;
  final String lang;

  @override
  State<LetterPdfViewerScreen> createState() => _LetterPdfViewerScreenState();
}

class _LetterPdfViewerScreenState extends State<LetterPdfViewerScreen> {
  late String pdfPath;
  final headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${SharedPrefs.instance.getString(key: SharedPrefsKeys.token)}',
  };
  late FileDownloadManager fileManager;
  int? progress;

  @override
  void initState() {
    super.initState();
    pdfPath = '${Endpoints.baseUrl}letters/${widget.id}?lang=${widget.lang}';
    fileManager = FileDownloadManager(fileUrl: pdfPath, headers: headers);
    fileManager.events.listen((data) {
      String id = data[0].toString();
      if (fileManager.taskId == id) {
        int progress = data[2];
        print('progress = $progress');
        setState(() {
          this.progress = progress;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final status = await Permission.storage.request();
          if (status.isGranted) {
            await fileManager.downloadFile();
            HelperMethod.showSnackBar(
              title: LocalizationKeys.done.tr,
              message: LocalizationKeys.successfullyDownloadedFileOnYourDevice.tr,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
          }
        },
        icon: const Icon(Icons.download),
        label: Text(LocalizationKeys.downloadFile.tr),
      ),
      appBar: AppBar(
        title: Text(LocalizationKeys.letterPdfViewer.tr),
      ),
      body: SfPdfViewer.network(
        pdfPath,
        headers: headers,
      ),
    );
  }
}
