import 'package:esu/core/const/end_point.dart';
import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
    'Authorization':
        'Bearer ${SharedPrefs.instance.getString(key: SharedPrefsKeys.token)}',
  };

  @override
  void initState() {
    super.initState();
    pdfPath = '${Endpoints.baseUrl}letters/${widget.id}?lang=${widget.lang}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
