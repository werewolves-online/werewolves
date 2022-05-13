import 'package:flutter/material.dart';
import 'package:werewolves/ui/pages/main_menu/main_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        key: const Key("main_MaterialApp"),
        title: 'Werewolves App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Center(
            child: Scaffold(
                key: const Key("main_Scaffold"),
                appBar: AppBar(
                    key: const Key("main_AppBar"),
                    title: const Center(child: Text('Werewolves App'))),
                body: const MainMenuPage())));
  }
}
