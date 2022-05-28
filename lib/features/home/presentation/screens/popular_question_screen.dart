import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/features/home/presentation/widgets/popular_question_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class PopularQuestionScreen extends StatefulWidget {
  const PopularQuestionScreen({Key? key}) : super(key: key);

  @override
  State<PopularQuestionScreen> createState() => _PopularQuestionScreenState();
}

class _PopularQuestionScreenState extends State<PopularQuestionScreen> {
  bool expand = false;
  int? tapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.faq.tr)),
      body: ListView.separated(
        itemCount: 5,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
        separatorBuilder: (_, index) => SizedBox(height: 8.h),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (((tapped == null) || ((index == tapped) || !expand))) {
                  expand = !expand;
                } else {
                  expand = expand;
                }
                tapped = index;
              });
            },
            child: PopularQuestionItemWidget(
              index: index,
              isExpanded: index == tapped ? expand : false,
            ),
          );
        },
      ),
    );
  }
}
