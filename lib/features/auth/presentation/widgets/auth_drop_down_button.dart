import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthDropDownButton extends StatefulWidget {
  const AuthDropDownButton({
    Key? key,
    required this.list,
    required this.onChangeValue,
    this.isDense = false,
  }) : super(key: key);

  final List<String> list;
  final void Function(String value) onChangeValue;
  final bool isDense;

  @override
  State<AuthDropDownButton> createState() => _AuthDropDownButtonState();
}

class _AuthDropDownButtonState extends State<AuthDropDownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      hint: Text('Select'),
      isDense: widget.isDense,
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      elevation: 2,
      dropdownColor: Colors.white,
      decoration: InputDecoration(),
      style: const TextStyle(color: AppColors.primaryColor),
      onChanged: (newValue) {
        widget.onChangeValue(newValue!);
        setState(() => dropdownValue = newValue);
      },
      items: widget.list.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            width: .7.sw,
            child: Text(
              value,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }
}
