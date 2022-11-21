import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppCheckboxWithTextWidget extends StatefulWidget {
  AppCheckboxWithTextWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  final Function(bool) onChanged;
  bool value;
  final String title;

  @override
  State<AppCheckboxWithTextWidget> createState() =>
      _AppCheckboxWithTextWidgetState();
}

class _AppCheckboxWithTextWidgetState
    extends State<AppCheckboxWithTextWidget> {
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
              activeColor: Theme.of(context).primaryColor,
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
