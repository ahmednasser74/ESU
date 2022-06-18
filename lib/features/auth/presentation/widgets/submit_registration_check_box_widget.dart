import 'package:esu/core/localization/localization_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SubmitRegistrationCheckBoxWidget extends StatefulWidget {
  SubmitRegistrationCheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final Function(bool) onChanged;
  bool value;

  @override
  State<SubmitRegistrationCheckBoxWidget> createState() =>
      _SubmitRegistrationCheckBoxWidgetState();
}

class _SubmitRegistrationCheckBoxWidgetState
    extends State<SubmitRegistrationCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.value = !widget.value;
        widget.onChanged(widget.value);
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
            child: Checkbox(
              value: widget.value,
              onChanged: (newValue) {
                widget.value = !widget.value;
                widget.onChanged(widget.value);
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: Text(LocalizationKeys.iReadAndAgree.tr),
          ),
        ],
      ),
    );
  }
}
