import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.settings.tr)),
      body: const Center(
        child: Text('Setting'),
      ),
    );
  }
}
