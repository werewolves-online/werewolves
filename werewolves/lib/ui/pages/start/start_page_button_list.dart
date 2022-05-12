import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartPageButtonList extends StatelessWidget {
  const StartPageButtonList({Key? key}) : super(key: key);

  final double distanceBetweenButtons = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton.filled(
            child: const Text('Start a Game'),
            onPressed: () => navigate(context)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('Join a Game'),
            onPressed: () => navigate(context)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('About Us'), onPressed: () => navigate(context)),
        SizedBox(height: distanceBetweenButtons),
        CupertinoButton.filled(
            child: const Text('Support Us'),
            onPressed: () => navigate(context)),
      ],
    );
  }

  navigate(context) {
    return showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => CupertinoAlertDialog(
              title: const Text('Alert!'),
              actions: [
                okButton(context),
              ],
            ));
  }

  Widget okButton(context) {
    return TextButton(
      child: const Text("OK"),
      onPressed: () => Navigator.pop(context),
    );
  }
}
