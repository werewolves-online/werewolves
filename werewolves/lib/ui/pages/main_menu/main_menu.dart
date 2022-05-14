import 'package:flutter/material.dart';
import 'package:werewolves/ui/pages/main_menu/main_menu_button_list.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  final double distanceBetweenImageAndButtons = 100;
  final double distanceBetweenAppBarAndImage = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 160, 36, 27),
        body: Center(
            child: Column(children: [
          SizedBox(height: distanceBetweenAppBarAndImage),
          Image.asset(
              'assets/images/werewolves_online.png'), //TODO REPLACE WITH OUR OWN ART
          SizedBox(height: distanceBetweenImageAndButtons),
          const MainMenuButtonList(),
        ])));
  }
}
