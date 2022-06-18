import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:esu/core/src/widgets/error_widget.dart';
import 'package:esu/core/src/widgets/horizontal_list_builder.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/core/utils/helper_methods.dart';
import 'package:esu/features/student_data/presentation/controller/access_to_moodle_controller.dart';
import 'package:esu/features/student_data/presentation/widgets/video_player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccessToMoodleScreen extends GetView<AccessToMoodleController> {
  const AccessToMoodleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.accessToMoodle.tr)),
      body: Obx(
        () => ConditionalBuilder(
          condition: controller.isLoading.value,
          builder: (_) => const LoadingIndicatorWidget(),
          fallback: (_) => ConditionalBuilder(
            condition: controller.isError.value,
            builder: (_) => AppErrorWidget(
              errorMessage: controller.errorMessage.value,
            ),
            fallback: (_) => Column(
              children: [
                HorizontalListBuilder(
                  itemCount: controller.filesList.length,
                  heightList: .40.sh,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1.w,
                          blurRadius: 2.w,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        controller.filesList.elementAt(index),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                HorizontalListBuilder(
                  itemCount: controller.videosList.length,
                  heightList: .30.sh,
                  itemBuilder: (_, index) => VideoPlayerItemWidget(
                    videoId:
                        controller.videosList.elementAt(index).split('/').last,
                  ),
                ),
                SizedBox(height: 12.h),
                AppButton(
                  title: LocalizationKeys.moodleUrl.tr,
                  onPressed: () => HelperMethod.launchToBrowser(
                    controller.moodleUrl.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ), // body: controller.obx(
    );
  }
}
