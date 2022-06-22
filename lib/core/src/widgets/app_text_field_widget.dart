import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final AutovalidateMode? autovalidateMode;
  final bool readOnly;
  final void Function(String? v)? onChanged;
  final bool dispose;
  final bool acceptArabicCharOnly;
  final VoidCallback? onTap;

  const AppTextFieldWidget({
    Key? key,
    this.controller,
    this.inputType,
    this.prefixIcon,
    this.hint,
    this.obscureText = false,
    this.readOnly = false,
    this.acceptArabicCharOnly = false,
    this.dispose = true,
    this.suffixIcon,
    this.validator,
    this.labelText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.onTap,
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
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: TextInputAction.next,
      autovalidateMode: widget.autovalidateMode,
      inputFormatters: [
        if (widget.acceptArabicCharOnly) FilteringTextInputFormatter.allow(RegExp('^[\u0621-\u064A\u0660-\u0669 ]+\$')),
      ],
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.labelText,
        errorMaxLines: 2,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  passwordVisibility ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor,
                ),
                onPressed: () => setState(() => passwordVisibility = !passwordVisibility),
              )
            : null,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller != null && widget.dispose) {
      widget.controller!.dispose();
    }
    super.dispose();
  }
}
