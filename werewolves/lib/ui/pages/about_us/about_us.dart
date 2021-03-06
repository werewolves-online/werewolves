import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  static const String name = 'about_us';
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: const Center(
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
