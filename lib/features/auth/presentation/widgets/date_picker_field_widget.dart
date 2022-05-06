import 'dart:io';

import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DatePickerFieldWidget extends StatefulWidget {
  const DatePickerFieldWidget({
    Key? key,
    required this.dateCallBack,
    required this.dateController,
  }) : super(key: key);
  final void Function(DateTime? countryName) dateCallBack;
  final TextEditingController dateController;

  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DatePickerFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateController,
      readOnly: true,
      // decoration: InputDecoration(labelText: LocalizationKeys.dateOfBirth.tr),
      validator: (value) {
        if (widget.dateController.text.isEmpty) {
          return LocalizationKeys.thisFieldIsRequired.tr;
        } else {
          return null;
        }
      },
      onTap: () => Platform.isAndroid
          ? _androidDatePicker(context)
          : _iosDatePicker(context),
    );
  }

  Future<void> _androidDatePicker(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2100),
        locale: Locale(SharedPrefs.instance.getLanguageSelected()));
    if (picked != null && picked != DateTime.now()) {
      widget.dateCallBack(picked);
      widget.dateController.text =
          '${picked.day} / ${picked.month} / ${picked.year}';
    }
  }

  Future _iosDatePicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      builder: (BuildContext builder) {
        return SafeArea(
          child: Container(
            height: .3.sh,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                widget.dateCallBack(picked);
                widget.dateController.text =
                    '${picked.day} / ${picked.month} / ${picked.year}';
              },
              initialDateTime: DateTime.now(),
              minimumYear: 1800,
              maximumYear: 2100,
            ),
          ),
        );
      },
    );
  }
}
