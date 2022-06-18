import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class TitleDropDownButton extends StatefulWidget {
  const TitleDropDownButton({
    Key? key,
    required this.list,
    required this.onChangeValue,
    this.isDense = false,
  }) : super(key: key);

  final List<String> list;
  final void Function(String value) onChangeValue;
  final bool isDense;

  @override
  State<TitleDropDownButton> createState() => _TitleDropDownButtonState();
}

class _TitleDropDownButtonState extends State<TitleDropDownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null) {
          return LocalizationKeys.thisFieldIsRequired.tr;
        } else {
          return null;
        }
      },
      hint: Text(LocalizationKeys.select.tr),
      isDense: widget.isDense,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      elevation: 2,
      dropdownColor: Colors.white,
      decoration: const InputDecoration(),
      style: const TextStyle(
        color: AppColors.primaryColor,
        fontFamily: 'din',
      ),
      onChanged: (newValue) {
        widget.onChangeValue(newValue!);
        setState(() => dropdownValue = newValue);
      },
      items: widget.list.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: SizedBox(
            width: .7.sw,
            child: Text(
              value,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'din',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
