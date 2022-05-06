import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/features/auth/data/model/response/lookup/lookup_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class LookupDropDownButton extends StatefulWidget {
  const LookupDropDownButton({
    Key? key,
    required this.list,
    required this.onChangeValue,
    this.isDense = false,
  }) : super(key: key);

  final List<LookupDataResponseModel> list;
  final void Function(String value) onChangeValue;
  final bool isDense;

  @override
  State<LookupDropDownButton> createState() => _LookupDropDownButtonState();
}

class _LookupDropDownButtonState extends State<LookupDropDownButton> {
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
      style: const TextStyle(color: AppColors.primaryColor, fontFamily: 'din'),
      onChanged: (newValue) {
        widget.onChangeValue(newValue!);
        setState(() => dropdownValue = newValue);
      },
      items: widget.list.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: Get.locale.toString() == 'en' ? value.name : value.nameAr,
          child: SizedBox(
            width: .7.sw,
            child: Text(
              Get.locale.toString() == 'en' ? value.name : value.nameAr,
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
