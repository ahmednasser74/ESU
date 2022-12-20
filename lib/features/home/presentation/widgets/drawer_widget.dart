import 'package:esu/core/helper/app_info_helper.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/home/presentation/controller/home_controller.dart';
import 'package:esu/features/home/presentation/controller/logout_controler_controller.dart';
import 'package:esu/features/home/presentation/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../screens/moodle_login_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final student = SharedPrefs.instance.getUser();
  String? appVersion;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appVersion = AppInfoHelper.getAppVersion;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200.h,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: Theme.of(context).primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConditionalBuilder(
                condition: student.photo != null,
                builder: (_) => CircleAvatar(
                  backgroundImage: NetworkImage(student.photo!),
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 40.r,
                ),
                fallback: (_) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whiteColor, width: 2.w),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Assets.icons.profileIcon.image(
                      color: AppColors.whiteColor,
                      height: 30.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                LocalizationKeys.hello.tr,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  Get.locale.toString() == 'en' ? SharedPrefs.instance.getUser().nameEn : SharedPrefs.instance.getUser().nameAr,
                  style: TextStyle(color: Colors.white, fontSize: 16.r),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Text(LocalizationKeys.profile.tr),
                leading: Assets.icons.profileIcon.image(
                  color: Theme.of(context).primaryColor,
                  height: 18.h,
                ),
                onTap: () {
                  // Get.to(
                  //   WebViewScreen(
                  //     url: 'https://sisdev.esu.ac.ae/forms',
                  //     onBackCallBack: () {},
                  //   ),
                  // );
                  Navigator.pop(context);
                  Get.toNamed(Routes.profileScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.notification.tr),
                leading: Assets.icons.notificationIcon.image(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.notificationScreen);
                },
              ),
              GetBuilder<HomeController>(
                builder: (controller) => ListTile(
                  title: Text(LocalizationKeys.moodleLogin.tr),
                  leading: Assets.icons.accessToMoodle.image(
                    color: Theme.of(context).primaryColor,
                    height: 22.h,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (controller.homeResponse.data?.allowToLoginWithFaceId ?? false) {
                      Get.dialog(MoodleLoginScreen());
                    } else {
                      HelperMethod.launchToBrowser('https://moodle.esu.ac.ae/login/index.php');
                    }
                  },
                ),
              ),
              ListTile(
                title: Text(LocalizationKeys.finance.tr),
                leading: Assets.icons.financeIcon.image(
                  color: Theme.of(context).primaryColor,
                  height: 24.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.financeScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.letters.tr),
                leading: Assets.icons.letterIcon.image(
                  color: Theme.of(context).primaryColor,
                  height: 22.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.lettersScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.transcript.tr),
                leading: Assets.icons.transcriptIcon.image(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.transcriptScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.studentCard.tr),
                leading: Assets.icons.identity.image(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.studentCardScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.studyPlans.tr),
                leading: Assets.icons.studyPlan.image(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.studyPlanScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.termRegistration.tr),
                leading: Assets.icons.termRegistration.image(
                  color: Theme.of(context).primaryColor,
                  height: 26.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.termRegistrationScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.editCourses.tr),
                leading: Assets.icons.termRegistration.image(
                  color: Theme.of(context).primaryColor,
                  height: 26.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.coursesRegisteredScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.attendance.tr),
                leading: Assets.icons.attendance.image(
                  color: Theme.of(context).primaryColor,
                  height: 22.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.attendanceScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.accessToMoodle.tr),
                leading: Assets.icons.accessToMoodle.image(
                  color: Theme.of(context).primaryColor,
                  height: 22.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.accessToMoodleScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.lectureTable.tr),
                leading: Assets.icons.lecture.image(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.lectureTableScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.schedule.tr),
                leading: Assets.icons.schedule.image(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.scheduleScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.ticketSupport.tr),
                leading: Assets.icons.ticket.image(
                  color: Theme.of(context).primaryColor,
                  height: 26.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.ticketsScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.faq.tr),
                leading: Assets.icons.faq.image(
                  color: Theme.of(context).primaryColor,
                  height: 26.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.popularQuestionScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.settings.tr),
                leading: Assets.icons.settingIcon.image(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.settingsScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.logout.tr),
                leading: Assets.icons.logout.image(
                  color: Theme.of(context).primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Get.back();
                  LogoutDialog(
                    onTapLogout: Get.find<LogoutController>().logout,
                  ).show(context);
                },
              ),
              Divider(color: Theme.of(context).colorScheme.secondary),
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 10.h,
                ),
                child: Center(
                  child: Text(
                    'v$appVersion',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
