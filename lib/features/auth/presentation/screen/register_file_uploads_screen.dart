import 'dart:io';

import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/features/auth/presentation/file_properties.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterFileUploadsScreen extends StatelessWidget {
  RegisterFileUploadsScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Files Upload')),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleRequiredFieldWidget(
                title: 'A copy of your ID or passport',
              ),
              FilePickerWidget(fileCallBack: (file) {}),
              const TitleRequiredFieldWidget(
                title: 'A copy of the academic certificate',
              ),
              FilePickerWidget(fileCallBack: (file) {}),
              const TitleRequiredFieldWidget(title: 'A copy of transcript'),
              FilePickerWidget(fileCallBack: (file) {}),
              const TitleRequiredFieldWidget(
                title: 'A copy of the students contract with the university',
                titleSize: 18,
              ),
              InkWell(
                onTap: () async => await _launchUrl(
                  'https://esu.ac.ae/wp-content/uploads/2021/10/pro_con.pdf',
                ),
                child: const Text(
                  '(Bachelor/Master contract download link)',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () async => await _launchUrl(
                  'https://esu.ac.ae/wp-content/uploads/2021/11/phd_co_04.pdf',
                ),
                child: const Text(
                  '(PHD contract download link)',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The contract must be signed handwritten and on all pages!',
                style: TextStyle(color: Colors.red, fontSize: 13),
              ),
              const SizedBox(height: 8),
              FilePickerWidget(fileCallBack: (file) {}),
              const SizedBox(height: 8),
              const TitleRequiredFieldWidget(title: 'Upload CV'),
              FilePickerWidget(fileCallBack: (file) {}),
              SizedBox(height: 30.h),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('validate');
                  } else {
                    print('Not validate');
                  }
                },
                title: 'Next',
                minimumSize: const Size(double.infinity, 30),
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({
    Key? key,
    required this.fileCallBack,
  }) : super(key: key);
  final void Function(File?) fileCallBack;

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
      decoration: const InputDecoration(hintText: 'Select File'),
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
          return 'This file is required';
        } else {
          return null;
        }
      },
    );
  }
}
