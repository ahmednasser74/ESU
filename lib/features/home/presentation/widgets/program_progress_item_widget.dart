import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/src/colors.dart';
import '../../../../core/src/widgets/app_container.dart';
import '../../data/models/response/home/program_progress_item_response_model.dart';

class ProgramProgressItemWidget extends StatelessWidget {
  const ProgramProgressItemWidget({Key? key, required this.programProgress}) : super(key: key);
  final ProgramProgressItemResponseModel programProgress;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      boxShadowOffset: const Offset(0, 6),
      boxShadowBlurColor: AppColors.primaryColor.withOpacity(0.5),
      padding: EdgeInsets.all(4.r),
      child: CircularPercentIndicator(
        radius: 40.r,
        lineWidth: 8.r,
        animation: true,
        percent: programProgress.completePercentage / 100,
        center: Text(
          '${programProgress.completePercentage}%',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),

        footer: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Text(programProgress.name,textAlign: TextAlign.center,),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: AppColors.primaryColor,
        backgroundColor: AppColors.primaryColor.withOpacity(0.15),
      ),
    );
  }
}
