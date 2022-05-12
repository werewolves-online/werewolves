import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SelectableText.rich(
          TextSpan(
            text: 'Welcome to our open source werewolves app,\n',
            children: [
              TextSpan(text: 'This app is work in progress,\n'),
              TextSpan(
                text:
                    'You can find source code here https://github.com/werewolves-online/werewolves\n',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
