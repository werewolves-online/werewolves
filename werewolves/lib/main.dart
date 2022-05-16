import 'package:flutter/material.dart';
import 'package:werewolves/ui/login.dart';
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
      initialRoute: LoginPage.name,
      routes: {
        LoginPage.name: (context) => const LoginPage(),
        MainMenuPage.name: (context) => const MainMenuPage(),
      },
      home: const LoginPage(),
    );
  }
}
