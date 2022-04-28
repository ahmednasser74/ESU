import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterAcademicInfoScreen extends StatefulWidget {
  const RegisterAcademicInfoScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAcademicInfoScreen> createState() =>
      _RegisterAcademicInfoScreenState();
}

class _RegisterAcademicInfoScreenState
    extends State<RegisterAcademicInfoScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academic Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              TitleRequiredFieldWidget(title: 'Current Certificate'),
              MyStatefulWidget(
                list: ['Secondary School', 'Bachelor', 'Master'],
                onChangeValue: (value) => print(value),
              ),
              Spacer(),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('validate');
                  } else {
                    print('Not validate');
                  }
                },
                title: 'Next',
                minimumSize: Size(double.infinity, 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({
    Key? key,
    required this.list,
    required this.onChangeValue,
  }) : super(key: key);
  final List<String> list;
  final void Function(String value) onChangeValue;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      validator: (value) {
        if (dropdownValue == null) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      hint: Text('Select'),
      elevation: 2,
      dropdownColor: Colors.white,
      style: const TextStyle(color: AppColors.primaryColor),
      isDense: true,
      onChanged: (newValue) {
        widget.onChangeValue(newValue!);
        setState(() => dropdownValue = newValue);
      },
      items: widget.list.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: .45.sw),
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }
}
//    return FormField(
//       builder: (field) {
//         return InputDecorator(
//           decoration: InputDecoration(
//             errorText: field.isValid ? 'this field is required' : null,
//             enabledBorder: field.isValid
//                 ? OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red, width: 1.0),
//                     borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                   )
//                 : null,
//           ),
//           child: DropdownButtonFormField<String>(
//             value: dropdownValue,
//             validator: (value) {
//               if (dropdownValue == null) {
//                 return 'This field is required';
//               } else {
//                 return null;
//               }
//             },
//
//             icon: const Icon(Icons.keyboard_arrow_down_rounded),
//             hint: Text('Select'),
//             elevation: 2,
//             dropdownColor: Colors.white,
//             style: const TextStyle(color: AppColors.primaryColor),
//             isDense: true,
//             onChanged: (newValue) {
//               widget.onChangeValue(newValue!);
//               setState(() => dropdownValue = newValue);
//             },
//             items: widget.list.map<DropdownMenuItem<String>>((value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.only(end: .45.sw),
//                   child: Text(
//                     value,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
