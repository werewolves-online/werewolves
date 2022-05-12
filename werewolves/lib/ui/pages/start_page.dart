import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werewolves/ui/pages/start_page_button_list.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  final double distanceBetweenImageAndButtons = 100;
  final double distanceBetweenAppBarAndImage = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 160, 36, 27),
        body: Center(
            child: Column(children: [
          SizedBox(height: distanceBetweenAppBarAndImage),
          Image.asset('assets/images/werewolves_online.png'), //TODO REPLACE WITH OUR OWN ART
          SizedBox(height: distanceBetweenImageAndButtons),
          const StartPageButtonList(),
        ])));
  }
}
