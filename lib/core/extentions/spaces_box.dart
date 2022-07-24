import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacesBox on num {
  Widget get heightBox => SizedBox(height: ScreenUtil().setHeight(this));

  Widget get widthBox => SizedBox(height: ScreenUtil().setHeight(this));
}
