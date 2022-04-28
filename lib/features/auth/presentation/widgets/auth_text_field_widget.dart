import 'package:flutter/material.dart';

import '../../../../core/src/colors.dart';

class AuthTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? v)? validator;
  final String? labelText;

  AuthTextFieldWidget({
    required this.controller,
    required this.inputType,
    this.prefixIcon,
    this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.labelText,
  });

  @override
  _AuthTextFieldWidgetState createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  late bool passwordVisibility;

  @override
  void initState() {
    super.initState();
    passwordVisibility = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordVisibility,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.inputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.labelText,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  passwordVisibility ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor,
                ),
                onPressed: () =>
                    setState(() => passwordVisibility = !passwordVisibility),
              )
            : null,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
