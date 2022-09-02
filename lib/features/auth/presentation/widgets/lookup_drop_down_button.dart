import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/features/auth/data/model/response/lookup/lookup_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LookupDropDownButton extends StatefulWidget {
  const LookupDropDownButton({
    Key? key,
    required this.list,
    required this.onChangeValue,
    this.isDense = false,
  }) : super(key: key);

  final List<LookupDataResponseModel> list;
  final void Function(int value) onChangeValue;
  final bool isDense;

  @override
  State<LookupDropDownButton> createState() => _LookupDropDownButtonState();
}

class _LookupDropDownButtonState extends State<LookupDropDownButton> {
  LookupDataResponseModel? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<LookupDataResponseModel>(
      value: dropdownValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null) {
          return LocalizationKeys.thisFieldIsRequired.tr;
        } else {
          return null;
        }
      },
      hint: Text(LocalizationKeys.select.tr, style: const TextStyle(color: Colors.grey)),
      isDense: widget.isDense,
      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
      elevation: 2,
      dropdownColor: Colors.white,
      decoration: const InputDecoration(),
      style: const TextStyle(color: AppColors.primaryColor, fontFamily: 'din'),
      onChanged: (newValue) {
        widget.onChangeValue(newValue!.id);
        setState(() => dropdownValue = newValue);
      },
      items: widget.list.map<DropdownMenuItem<LookupDataResponseModel>>(
        (value) {
          return DropdownMenuItem<LookupDataResponseModel>(
            value: value,
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
        },
      ).toList(),
    );
  }
}
