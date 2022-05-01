import 'dart:io';

import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/file_properties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({
    Key? key,
    required this.fileCallBack,
    this.hint,
  }) : super(key: key);
  final void Function(File?) fileCallBack;
  final String? hint;

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget>
    with FileProperties {
  final fileTEC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: fileTEC,
      decoration: InputDecoration(
        hintText: widget.hint ?? LocalizationKeys.selectFile.tr,
      ),
      onTap: () async {
        final file = await pickedFile();
        if (file != null) {
          final fileSize = await getFileSize(filepath: file.path, decimals: 1);
          final fileName = file.path.split('/').last;
          fileTEC.text = '$fileName - $fileSize';
          widget.fileCallBack(file);
        }
      },
      validator: (value) {
        if (fileTEC.text.isEmpty) {
          return LocalizationKeys.thisFieldIsRequired.tr;
        } else {
          return null;
        }
      },
    );
  }
}
