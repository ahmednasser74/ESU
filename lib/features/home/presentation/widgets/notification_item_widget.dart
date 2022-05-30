import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/keep_live_widget.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/home/data/models/response/notification/notification_response_model.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItemWidget extends StatefulWidget {
  const NotificationItemWidget({
    Key? key,
    required this.onTapItem,
    required this.notification,
  }) : super(key: key);
  final NotificationItemResponseModel notification;
  final VoidCallback onTapItem;

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  ExpandableController? expandableController;

  late bool isNewNotification;

  @override
  void initState() {
    isNewNotification = widget.notification.status == 'new';
    expandableController = ExpandableController(initialExpanded: false);
    expandableController!.addListener(() {
      if (expandableController!.expanded) {
        setState(() => isNewNotification = false);
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
              header: GestureDetector(
                onTap: () {
                  expandableController!.toggle();
                  if (widget.notification.status == 'new') {
                    widget.onTapItem.call();
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                  child: Text(
                    widget.notification.title,
                    style: TextStyle(
                      color: expandableController!.expanded
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      fontSize: 14.sp,
                    ),
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
                  data: widget.notification.body,
                  onLinkTap: (url, _, attributes, element) async {
                    if (url != null) {
                      await HelperMethod.launchToBrowser(url);
                    }
                  },
                ),
              ),
              collapsed: const SizedBox.shrink(),
            ),
            Visibility(
              visible: isNewNotification,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 3.r,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
