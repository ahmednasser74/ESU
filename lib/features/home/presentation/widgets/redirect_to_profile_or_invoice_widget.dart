import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/styles.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/home/presentation/controller/home_controller.dart';
import 'package:boilerplate/features/home/presentation/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RedirectToProfileOrInvoiceWidget extends StatelessWidget {
  const RedirectToProfileOrInvoiceWidget({
    Key? key,
    required this.redirectToProfile,
    required this.redirectToInvoice,
  }) : super(key: key);
  final bool redirectToProfile;
  final bool redirectToInvoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationKeys.home.tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Assets.icons.logout.image(
              height: 16.sp,
              color: AppColors.primaryColor,
            ),
            onPressed: () => LogoutDialog(
              onTapLogout: () {
                SharedPrefs.instance.removeAllKeys();
                Get.offAllNamed(Routes.loginScreen);
              },
            ).show(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => Get.find<HomeController>().getHomeData(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(height: .30.sh),
            Visibility(
              visible: redirectToInvoice,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: CustomStyle.containerShadowDecoration.copyWith(
                      border: Border.all(color: Colors.red),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.warning_rounded, color: Colors.red),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            LocalizationKeys
                                .youMustPayInvoiceToCompleteAnyProcess.tr,
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),
                  AppButton(
                    title: LocalizationKeys.goToInvoice.tr,
                    onPressed: () => Get.toNamed(Routes.financeScreen),
                    fonSize: 14.sp,
                  ),
                ],
              ),
            ),
            SizedBox(height: .15.sh),
            Visibility(
              visible: redirectToProfile,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: CustomStyle.containerShadowDecoration.copyWith(
                      border: Border.all(color: Colors.red),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.warning_rounded, color: Colors.red),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            LocalizationKeys
                                .youMustCompleteProfileFilesToCompleteAnyProcess
                                .tr,
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),
                  AppButton(
                    title: LocalizationKeys.goToProfile.tr,
                    onPressed: () => Get.toNamed(Routes.profileScreen),
                    fonSize: 14.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
