import 'package:flutter/cupertino.dart';
import 'package:werewolves/ui/pages/about_us/about_us.dart';
import 'package:werewolves/ui/pages/start_game/start_game.dart';
import 'package:werewolves/ui/pages/join_game/join_game.dart';
import 'package:werewolves/ui/pages/support_us/support_us.dart';

class MainMenuButtonList extends StatelessWidget {
  const MainMenuButtonList({Key? key}) : super(key: key);

  final double distanceBetweenButtons = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton.filled(
            child: const Text('Start a Game'),
            onPressed: () => Navigator.pushNamed(context, StartGamePage.name)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('Join a Game'),
            onPressed: () => Navigator.pushNamed(context, JoinGamePage.name)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('About Us'),
            onPressed: () => Navigator.pushNamed(context, AboutUsPage.name)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('Support Us'),
            onPressed: () => Navigator.pushNamed(context, SupportUsPage.name)),
      ],
    );
  }
}
