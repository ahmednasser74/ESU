import 'package:flutter/material.dart';

class LettersScreen extends StatelessWidget {
  const LettersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Letters')),
      body: Container(color: Colors.green),
    );
  }
}
