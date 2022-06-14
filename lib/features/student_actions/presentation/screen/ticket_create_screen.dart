import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketCreateScreen extends StatelessWidget {
  const TicketCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.ticketCreate.tr)),
      body: const Center(child: Text('Ticket Create')),
    );
  }
}
