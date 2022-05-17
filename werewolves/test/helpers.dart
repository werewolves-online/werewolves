import 'package:flutter/material.dart';
import 'package:werewolves/ui/login.dart';
import 'package:werewolves/ui/non_game_pages/main_menu/main_menu.dart';

class App extends StatelessWidget {
  final Widget home;

  const App({Key? key, required this.home}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home,
    );
  }
}

Widget createAppWithMainMenu() {
  return const App(home: MainMenuPage());
}

Widget createAppWithLoginPage() {
  return const App(home: LoginPage());
}
