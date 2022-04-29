import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';

class RegisterFileUploadsScreen extends StatelessWidget {
  RegisterFileUploadsScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Files Upload')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                TitleRequiredFieldWidget(
                  title: 'A copy of your ID or passport',
                ),
                TitleRequiredFieldWidget(
                  title: 'A copy of the academic certificate',
                ),
                TitleRequiredFieldWidget(title: 'A copy of transcript'),
                TitleRequiredFieldWidget(
                  title: 'A copy of the students contract with the university',
                ),
                TitleRequiredFieldWidget(title: 'Upload CV'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
