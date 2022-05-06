import 'dart:io';

import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/file_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({
    Key? key,
    required this.fileCallBack,
    this.hint,
    this.prefixIcon,
    this.fieldIsRequired = true,
    this.allowToPdf = false,
    this.allowToImages = false,
    this.allowToDoc = false,
    this.allowToDocx = false,
  }) : super(key: key);

  final void Function(File) fileCallBack;
  final String? hint;
  final Widget? prefixIcon;
  final bool fieldIsRequired;
  final bool allowToPdf;
  final bool allowToImages;
  final bool allowToDoc;
  final bool allowToDocx;

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
        hintText: LocalizationKeys.selectFile.tr + (widget.hint ?? ''),
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.all(12.w),
          child: widget.prefixIcon ?? Assets.icons.addFile.image(height: 18),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTapPickFile,
      validator: (value) {
        if (widget.fieldIsRequired) {
          if (fileTEC.text.isEmpty) {
            return LocalizationKeys.thisFieldIsRequired.tr;
          } else if (fileTEC.text == 'file is too large') {
            return LocalizationKeys.maxFileSizeIsTenMegabytes.tr;
          } else if (fileTEC.text == 'file type not allowed') {
            return LocalizationKeys.sorryThisFileTypeIsNotAllowed.tr;
          }
        } else {
          return null;
        }
        return null;
      },
    );
  }

  Future<void> onTapPickFile() async {
    final file = await pickedFile();
    if (file != null) {
      if (await isFileLowerThanTenMega(filepath: file.path)) {
        if (isFileTypeAllowed(filepath: file.path)) {
          final fileName = file.path.split('/').last;
          final fileSize = await getFileSize(filepath: file.path, decimals: 1);
          fileTEC.text = '$fileName - $fileSize';
          widget.fileCallBack(file);
        } else {
          fileTEC.text = 'file type not allowed';
        }
      } else {
        fileTEC.text = 'file is too large';
      }
    }
  }

  bool isFileTypeAllowed({required String filepath}) {
    if (widget.allowToImages) {
      if (fileIsImage(fileName: filepath)) {
        return true;
      }
    }
    if (widget.allowToPdf) {
      if (filepath.split('.').last == 'pdf') {
        return true;
      }
    }
    if (widget.allowToDoc) {
      if (filepath.split('.').last == 'doc') {
        return true;
      }
    }
    if (widget.allowToDocx) {
      if (filepath.split('.').last == 'docx') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
