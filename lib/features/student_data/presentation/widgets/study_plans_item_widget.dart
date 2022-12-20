import 'package:esu/core/src/colors.dart';
import 'package:esu/features/student_data/data/models/response/plans_of_study/program_data_response_model.dart';
import 'package:esu/features/student_data/presentation/widgets/course_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyPlansItemWidget extends StatelessWidget {
  const StudyPlansItemWidget({
    Key? key,
    required this.programData,
  }) : super(key: key);
  final ProgramDataResponseModel programData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            programData.name,
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
        SizedBox(height: 12.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: programData.courses.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final course = programData.courses.elementAt(index);
            return CourseItemWidget(course: course);
          },
        )
      ],
    );
  }
}
