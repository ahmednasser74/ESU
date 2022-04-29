import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/auth/presentation/widgets/submit_registration_check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SubmitRegistrationScreen extends StatefulWidget {
  const SubmitRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<SubmitRegistrationScreen> createState() =>
      _SubmitRegistrationScreenState();
}

class _SubmitRegistrationScreenState extends State<SubmitRegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  bool isApproved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.submitRegistration.tr)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primaryColor),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(1, 2),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Icon(Icons.notifications_rounded, size: 30),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      LocalizationKeys.weRecommendToUseEmail.tr,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: SubmitRegistrationCheckBoxWidget(
                      value: isApproved,
                      onChanged: (v) {
                        isApproved = v;
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => HelperMethod.launchToBrowser(
                        'https://esu.ac.ae/index.php/admissions',
                      ),
                      child: Text(
                        LocalizationKeys.termsAndCondition.tr,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              AppButton(
                onPressed: () {
                  if (isApproved) {
                    HelperMethod.showToast(msg: 'success');
                  } else {
                    HelperMethod.showToast(
                      msg: LocalizationKeys.mustToApproveOnTermsAndCondition.tr,
                    );
                  }
                },
                title: LocalizationKeys.submit.tr,
                minimumSize: const Size(double.infinity, 30),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
