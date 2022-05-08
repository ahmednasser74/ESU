import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/conditional_builder.dart';
import 'package:boilerplate/core/src/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyPlanstItemWidget extends StatelessWidget {
  const StudyPlanstItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConditionalBuilder(
          condition: index == 0 || index == 4,
          builder: (context) => Column(
            children: [
              SizedBox(height: index == 0 || index == 4 ? 12.h : 0),
              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  index == 0 || index == 4 ? 'Summer 2020' : '',
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              SizedBox(height: index == 0 || index == 4 ? 12.h : 0),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Text(
                  '#P1234',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 12.w,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Advanced Projects Management',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomRichText(
                          title: 'Hours : ',
                          titleValue: '4',
                        ),
                        CustomRichText(
                          title: 'Grade : ',
                          titleValue: 'A',
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomRichText(
                          title: 'Marks : ',
                          titleValue: '0',
                        ),
                        CustomRichText(
                          title: 'Points : ',
                          titleValue: '1',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
