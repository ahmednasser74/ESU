import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/file_helper/file_download_manager.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/utils/helper_methods.dart';

class PdfViewerWidget extends StatefulWidget {
  const PdfViewerWidget({
    Key? key,
    required this.pdfUrl,
  }) : super(key: key);
  final String pdfUrl;

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  final headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${SharedPrefs.instance.getString(key: SharedPrefsKeys.token)}',
  };
  late FileDownloadManager fileManager;
  int? progress;
  late final PermissionStatus storagePermissionStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      storagePermissionStatus = await Permission.storage.request();
    });
    fileManager = FileDownloadManager(fileUrl: widget.pdfUrl, headers: headers);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (storagePermissionStatus.isGranted) {
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
        widget.pdfUrl,
        headers: headers,
      ),
    );
  }
}
