import 'package:flutter/material.dart';

import '../colors.dart';

class AppTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? v)? validator;
  final String? labelText;

  const AppTextFieldWidget({
    Key? key,
    this.controller,
    this.inputType,
    this.prefixIcon,
    this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.labelText,
  }) : super(key: key);

  @override
  _AppTextFieldWidgetState createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
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

  @override
  void dispose() {
    if (widget.controller != null) widget.controller!.dispose();
    super.dispose();
  }
}