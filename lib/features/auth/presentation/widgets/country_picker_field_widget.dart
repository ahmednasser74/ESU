import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryPickerFieldWidget extends StatefulWidget {
  const CountryPickerFieldWidget({
    Key? key,
    required this.countryNameCallBack,
  }) : super(key: key);
  final void Function(String? countryName) countryNameCallBack;

  @override
  State<CountryPickerFieldWidget> createState() => _CountryPickerFieldState();
}

class _CountryPickerFieldState extends State<CountryPickerFieldWidget> {
  final countryNameTEC = TextEditingController();
  String? countryName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: countryNameTEC,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: true,
      onTap: () {
        showCountryPicker(
          context: context,
          countryListTheme: CountryListThemeData(
            bottomSheetHeight: .8.sw,
          ),
          onSelect: (Country country) {
            countryNameTEC.text = country.name;
            setState(() => countryName = country.name);
            widget.countryNameCallBack(countryName);
          },
        );
      },
      validator: (value) {
        if (countryName == null) {
          return 'This field is required';
        } else {
          return null;
        }
      },
    );
  }
}
