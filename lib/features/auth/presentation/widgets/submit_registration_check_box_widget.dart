import 'package:esu/core/localization/localization_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

// ignore: must_be_immutable
class CheckboxWithTextWidget extends StatefulWidget {
  CheckboxWithTextWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  final Function(bool) onChanged;
  bool value;
  final String title;

  @override
  State<CheckboxWithTextWidget> createState() =>
      _CheckboxWithTextWidgetState();
}

class _CheckboxWithTextWidgetState
    extends State<CheckboxWithTextWidget> {
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
            child: Text(widget.title),
          ),
        ],
      ),
    );
  }
}
