import 'package:esu/core/extentions/spaces_box.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/app_error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/home/presentation/controller/home_controller.dart';
import 'package:esu/features/home/presentation/widgets/drawer_widget.dart';
import 'package:esu/features/home/presentation/widgets/home_header_widget.dart';
import 'package:esu/features/home/presentation/widgets/program_progress_item_widget.dart';
import 'package:esu/features/home/presentation/widgets/redirect_to_profile_or_invoice_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ConditionalBuilder(
        condition: state!.data!.profileRedirect || state.data!.invoiceRedirect,
        builder: (_) => RedirectToProfileOrInvoiceWidget(
          redirectToInvoice: state.data!.invoiceRedirect,
          redirectToProfile: state.data!.profileRedirect,
        ),
        fallback: (_) => Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(LocalizationKeys.home.tr),
            leading: IconButton(
              icon: Assets.icons.menu.image(height: 20.sp),
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            ),
            actions: [
              IconButton(
                icon: Assets.icons.notificationIcon.image(
                  color: AppColors.primaryColor,
                  height: 18.h,
                ),
                onPressed: () => Get.toNamed(Routes.notificationScreen),
              ),
            ],
          ),
          drawer: const Drawer(child: DrawerWidget()),
          body: RefreshIndicator(
            onRefresh: () => controller.getHomeData(),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                HomeHeaderWidget(data: state.data!),
                SizedBox(height: 20.h),
                LinearPercentIndicator(
                  width: .92.sw,
                  animation: true,
                  alignment: MainAxisAlignment.center,
                  lineHeight: 36.h,
                  percent: state.data!.knowledgePointsAverage / 100,
                  center: Column(
                    children: [
                      2.heightBox,
                      Text(LocalizationKeys.knowledgeAmbassadorCredit.tr),
                      2.heightBox,
                      Text("${state.data!.knowledgePointsAverage}%"),
                    ],
                  ),
                  barRadius: Radius.circular(30.r),
                  progressColor: AppColors.primaryColor,
                  backgroundColor: Colors.grey.shade300,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 18.w, mainAxisSpacing: 18.w),
                  itemCount: state.data!.programProgress.length,
                  itemBuilder: (context, index) => ProgramProgressItemWidget(programProgress: state.data!.programProgress[index]),
                ),
              ],
            ),
          ),
        ),
      ),
      onLoading: const LoadingIndicatorWidget(),
      onError: (error) => AppErrorWidget(errorMessage: error.toString()),
    );
  }
}
