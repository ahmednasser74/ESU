import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/keep_live_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart' show parse;

class NotificationItemWidget extends StatefulWidget {
  const NotificationItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  ExpandableController? expandableController;

  late bool isNotificationSeen;

  @override
  void initState() {
    isNotificationSeen = false;
    expandableController = ExpandableController(initialExpanded: false);
    expandableController!.addListener(() {
      if (expandableController!.expanded) {
        setState(() => isNotificationSeen = true);
      }
      setState(() {});
    });
    super.initState();
  }

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
        child: Stack(
          children: [
            ExpandablePanel(
              controller: expandableController,
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
              ),
              header: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                child: Text(
                  'widget.popular Question. question!',
                  style: TextStyle(
                    color: expandableController!.expanded
                        ? Theme.of(context).primaryColor
                        : Colors.black,
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
                child: Text(
                  parse('widget.popularQuestion.answer').body!.text,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              collapsed: const SizedBox.shrink(),
            ),
            Visibility(
              visible: !isNotificationSeen,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 4.r,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
