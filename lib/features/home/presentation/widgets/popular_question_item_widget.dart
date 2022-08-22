import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/keep_live_widget.dart';
import 'package:esu/core/utils/helper_methods.dart';
import 'package:esu/features/home/data/models/response/popular_question/popular_question_response_model.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularQuestionItemWidget extends StatelessWidget {
  const PopularQuestionItemWidget({
    Key? key,
    required this.question,
  }) : super(key: key);
  final PopularQuestionDataResponseModel question;

  @override
  Widget build(BuildContext context) {
    return KeepAliveWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
          ),
          header: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            child: Text(
              question.question,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ),
          builder: (_, collapsed, expanded) => Expandable(
            collapsed: collapsed,
            expanded: expanded,
            theme: const ExpandableThemeData(
              crossFadePoint: 0,
            ),
          ),
          expanded: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 8,
            ),
            constraints: const BoxConstraints(minWidth: double.infinity),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Html(
              data: question.answer,
              style: {
                'p': Style(fontSize: FontSize(14.sp), color: Colors.black),
              },
              onLinkTap: (url, _, attributes, element) async {
                if (url != null) {
                  await HelperMethod.launchToBrowser(url);
                }
              },
            ),
          ),
          collapsed: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
