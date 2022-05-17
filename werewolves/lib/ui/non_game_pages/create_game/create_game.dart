import 'package:flutter/material.dart';

class CreateGamePage extends StatelessWidget {
  static const String name = 'create_game';
  const CreateGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Game')),
      body: const Text(CreateGamePage.name),
    );
  }
}
