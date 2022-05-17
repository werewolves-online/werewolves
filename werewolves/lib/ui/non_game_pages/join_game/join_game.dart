import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinGamePage extends StatelessWidget {
  static const String name = 'join_game';
  const JoinGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Join Game')),
        body: Column(
          children: [
            Row(
              children: [
                CupertinoButton(
                    child: const Text('Join Game'), onPressed: () => {})
              ],
            ),
          ],
        ));
  }
}
