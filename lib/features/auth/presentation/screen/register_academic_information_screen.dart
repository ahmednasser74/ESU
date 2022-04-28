import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterAcademicInfoScreen extends StatefulWidget {
  const RegisterAcademicInfoScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAcademicInfoScreen> createState() =>
      _RegisterAcademicInfoScreenState();
}

class _RegisterAcademicInfoScreenState
    extends State<RegisterAcademicInfoScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              TitleRequiredFieldWidget(title: 'Current Certificate'),
              AuthDropDownButton(
                list: ['Secondary School', 'Bachelor', 'Master'],
                onChangeValue: (value) => print(value),
              ),
              SizedBox(height: 18.h),
              TitleRequiredFieldWidget(title: 'Program'),
              AuthDropDownButton(
                list: [
                  'Bachelor of Project Management',
                  'Master of Project Management',
                  'Bachelor of Management',
                  'Master of Management',
                  'Master of Risk Management',
                  'Ph.D. in Project Management',
                  'Master of Science in Cybersecurity',
                  'Master of Science in Cybersecurity (Non-IT Background)',
                ],
                onChangeValue: (value) => print(value),
              ),
              Spacer(),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('validate');
                  } else {
                    print('Not validate');
                  }
                },
                title: 'Next',
                minimumSize: Size(double.infinity, 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
