import 'package:flutter/cupertino.dart';
import 'package:werewolves/ui/non_game_pages/about_us/about_us.dart';
import 'package:werewolves/ui/non_game_pages/create_game/create_game.dart';
import 'package:werewolves/ui/non_game_pages/join_game/join_game.dart';
import 'package:werewolves/ui/non_game_pages/support_us/support_us.dart';

class MainMenuButtonList extends StatelessWidget {
  const MainMenuButtonList({Key? key}) : super(key: key);

  final double distanceBetweenButtons = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton.filled(
            child: const Text('Create a Game'),
            onPressed: () => Navigator.pushNamed(context, CreateGamePage.name)),
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
