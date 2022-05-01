import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum NotificationFilterType { all, read, unread, New }

class NotificationFilterWidget extends StatefulWidget {
  const NotificationFilterWidget({Key? key, required this.onChange})
      : super(key: key);
  final void Function(NotificationFilterType) onChange;

  @override
  State<NotificationFilterWidget> createState() =>
      _NotificationFilterWidgetState();
}

class _NotificationFilterWidgetState extends State<NotificationFilterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String selectedValue = LocalizationKeys.all.tr;
  int selectedIndex = 0;

  List<PopupMenuItem> popMenuFilteredList = [];
  List<PopupMenuItem> popMenuFullList = [
    PopupMenuItem(
      child: Text(LocalizationKeys.all.tr, style: TextStyle(fontSize: 12.sp)),
      value: NotificationFilterType.all,
    ),
    PopupMenuItem(
      child: Text(LocalizationKeys.neww.tr, style: TextStyle(fontSize: 12.sp)),
      value: NotificationFilterType.New,
    ),
    PopupMenuItem(
      child: Text(LocalizationKeys.read.tr, style: TextStyle(fontSize: 12.sp)),
      value: NotificationFilterType.read,
    ),
    PopupMenuItem(
      child:
          Text(LocalizationKeys.unread.tr, style: TextStyle(fontSize: 12.sp)),
      value: NotificationFilterType.unread,
    ),
  ];

  @override
  void initState() {
    super.initState();
    removeSelectedIndex();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocalizationKeys.filterByType.tr,
            style: TextStyle(fontSize: 12.sp),
          ),
          InkWell(
            onTap: () {
              _showPopupMenu();
              _controller.forward();
            },
            child: Container(
              height: 38.h,
              width: 100.w,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff707070), width: .5),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedValue,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (_, child) => Transform.rotate(
                      angle: _controller.value * 3.1,
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPopupMenu() {
    final popUpBtn = showMenu(
      context: context,
      items: popMenuFilteredList,
      position: Get.locale.toString() == 'ar'
          ? RelativeRect.fromLTRB(14.w, .17.sh, 1.sw, 0)
          : RelativeRect.fromLTRB(1.sw, .17.sh, 14.w, 0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    );
    popUpBtn.then((result) {
      _controller.reverse();
      if (result != null) {
        widget.onChange(result);
        switch (result) {
          case NotificationFilterType.all:
            selectedValue = LocalizationKeys.all.tr;
            selectedIndex = 0;
            break;
          case NotificationFilterType.New:
            selectedValue = LocalizationKeys.neww.tr;
            selectedIndex = 1;
            break;
          case NotificationFilterType.read:
            selectedValue = LocalizationKeys.read.tr;
            selectedIndex = 2;
            break;
          case NotificationFilterType.unread:
            selectedValue = LocalizationKeys.unread.tr;
            selectedIndex = 3;
            break;
          default:
        }
        removeSelectedIndex();
        setState(() {});
      }
    });
  }

  void removeSelectedIndex() {
    popMenuFilteredList.clear();
    popMenuFilteredList.addAll(popMenuFullList);
    if (selectedIndex == 3) {
      popMenuFilteredList.removeLast();
    } else {
      popMenuFilteredList.removeAt(selectedIndex);
    }
  }
}
