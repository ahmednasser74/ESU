import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/features/auth/data/model/response/lookup/lookup_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LookupDropDownButton extends StatefulWidget {
  LookupDropDownButton({
    Key? key,
    required this.list,
    required this.onChangeValue,
    this.initId,
    this.programName,
    this.isDense = false,
  }) : super(key: key);

  final List<LookupDataResponseModel> list;
  final void Function(int value) onChangeValue;
  final bool isDense;
  final int? initId;
  String? programName;

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
        if (value == null && widget.initId == null) {
          return LocalizationKeys.thisFieldIsRequired.tr;
        } else {
          return null;
        }
      },
      hint: ConditionalBuilder(
        condition: widget.initId != null,
        builder: (context) => Text(
          widget.list.firstWhere((element) => element.id == widget.initId).name,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
        fallback: (context) => Text(LocalizationKeys.select.tr, style: const TextStyle(color: Colors.grey)),
      ),
      isDense: widget.isDense,
      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
      elevation: 2,
      dropdownColor: Colors.white,
      decoration: const InputDecoration(),
      style: const TextStyle(color: AppColors.primaryColor, fontFamily: 'din'),
      onChanged: (newValue) {
        widget.onChangeValue(newValue!.id);
        widget.programName = newValue.name;
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
