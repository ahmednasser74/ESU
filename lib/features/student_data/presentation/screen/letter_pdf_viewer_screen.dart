import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
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
  final headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${SharedPrefs.instance.getToken()}',
  };
  late String pdfPath;

  @override
  void initState() {
    super.initState();
    pdfPath =
        'https://sisv2.esu.ac.ae/api/letters/${widget.id}?lang=${widget.lang}';
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
