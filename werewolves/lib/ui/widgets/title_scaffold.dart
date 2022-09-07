import 'package:flutter/material.dart';

class TitleScaffold extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget body;
  const TitleScaffold({
    Key? key,
    required this.title,
    this.actions,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
    );
  }
}
