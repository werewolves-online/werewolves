import 'package:flutter/material.dart';
import 'package:werewolves/ui/login.dart';
import 'package:werewolves/ui/non_game_pages/about_us/about_us.dart';
import 'package:werewolves/ui/non_game_pages/create_game/create_game.dart';
import 'package:werewolves/ui/non_game_pages/join_game/join_game.dart';
import 'package:werewolves/ui/non_game_pages/main_menu/main_menu.dart';
import 'package:werewolves/ui/non_game_pages/support_us/support_us.dart';

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
        CreateGamePage.name: (context) => const CreateGamePage(),
        JoinGamePage.name: (context) => const JoinGamePage(),
        AboutUsPage.name: (context) => const AboutUsPage(),
        SupportUsPage.name: (context) => const SupportUsPage(),
      },
      home: const LoginPage(),
    );
  }
}
