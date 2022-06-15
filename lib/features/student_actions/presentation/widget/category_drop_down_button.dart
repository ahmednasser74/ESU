import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/features/student_actions/data/models/response/ticket_category/ticket_category_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class CategoryDropDownButton extends StatefulWidget {
  const CategoryDropDownButton({
    Key? key,
    required this.list,
    required this.onChangeValue,
    this.isDense = false,
  }) : super(key: key);

  final List<TicketsCategoriesDataResponseModel> list;
  final void Function(TicketsCategoriesDataResponseModel value) onChangeValue;
  final bool isDense;

  @override
  State<CategoryDropDownButton> createState() => _CategoryDropDownButtonState();
}

class _CategoryDropDownButtonState extends State<CategoryDropDownButton> {
  TicketsCategoriesDataResponseModel? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TicketsCategoriesDataResponseModel>(
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
      items: widget.list
          .map<DropdownMenuItem<TicketsCategoriesDataResponseModel>>((value) {
        return DropdownMenuItem<TicketsCategoriesDataResponseModel>(
          value: value,
          child: SizedBox(
            width: .7.sw,
            child: Text(
              value.name,
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
