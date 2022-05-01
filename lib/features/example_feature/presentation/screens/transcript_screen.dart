import 'package:flutter/material.dart';

class TranscriptScreen extends StatelessWidget {
  const TranscriptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transcript')),
      body: Container(color: Colors.green),
    );
  }
}
