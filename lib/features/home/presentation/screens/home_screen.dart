import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/home/presentation/controller/home_controller.dart';
import 'package:esu/features/home/presentation/widgets/drawer_widget.dart';
import 'package:esu/features/home/presentation/widgets/home_header_widget.dart';
import 'package:esu/features/home/presentation/widgets/home_item_widget.dart';
import 'package:esu/features/home/presentation/widgets/redirect_to_profile_or_invoice_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                Row(
                  children: [
                    HomeItemWidget(
                      color: Colors.blue,
                      title: LocalizationKeys.balance.tr,
                      amount: '${state.data!.balance}',
                    ),
                    HomeItemWidget(
                      color: Colors.orange,
                      title: LocalizationKeys.totalAmount.tr,
                      amount: '${state.data!.total}',
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    HomeItemWidget(
                      color: Colors.green,
                      title: LocalizationKeys.totalAmountPaid.tr,
                      amount: '${state.data!.paid}',
                    ),
                    HomeItemWidget(
                      color: Colors.red,
                      title: LocalizationKeys.totalAmountUnpaid.tr,
                      amount: '${state.data!.unpaid}',
                    ),
                  ],
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
