import 'package:flutter/cupertino.dart';
import 'package:werewolves/constants/page_names.dart';

import '../../../utils/navigator/navigator_util.dart';

class MainMenuButtonList extends StatelessWidget {
  const MainMenuButtonList({Key? key}) : super(key: key);

  final double distanceBetweenButtons = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton.filled(
            child: const Text('Start a Game'),
            onPressed: () =>
                NavigatorUtil.navigate(context, PageNames.startGame)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('Join a Game'),
            onPressed: () =>
                NavigatorUtil.navigate(context, PageNames.joinGame)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('About Us'),
            onPressed: () =>
                NavigatorUtil.navigate(context, PageNames.aboutUs)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('Support Us'),
            onPressed: () =>
                NavigatorUtil.navigate(context, PageNames.supportUs)),
      ],
    );
  }
}
