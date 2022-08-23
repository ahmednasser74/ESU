import 'package:esu/core/localization/localization_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/src/widgets/custom_button.dart';

class ShareInfoDialog extends StatelessWidget {
  const ShareInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20.r),
      child: Container(
        height: .30.sh,
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.info_outline_rounded, color: Colors.blueGrey, size: 40.r),
            Text(LocalizationKeys.publishPersonalInfoMessage.tr, textAlign: TextAlign.center),
            AppButton(onPressed: Get.back, title: LocalizationKeys.close.tr)
          ],
        ),
      ),
    );
  }
}
