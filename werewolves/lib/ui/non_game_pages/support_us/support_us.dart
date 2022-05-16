import 'package:flutter/material.dart';

class SupportUsPage extends StatelessWidget {
  static const String name = 'support_us';
  const SupportUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support Us')),
      body: const Text(SupportUsPage.name),
    );
  }
}
