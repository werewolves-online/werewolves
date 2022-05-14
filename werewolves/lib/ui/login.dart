import 'package:flutter/material.dart';
import 'package:werewolves/ui/pages/main_menu/main_menu.dart';
import 'package:werewolves/ui/widgets/round_button.dart';
import 'package:werewolves/utils/authentication.dart';

class LoginPage extends StatelessWidget {
  static const String name = 'login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&w=1000&q=80'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25),
                  child: Column(
                    children: const [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Welcome to Werewolves APP, let\'s get you started',
                        style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(top: 25, left: 24, right: 24),
                      child: RoundButtonWithLogo(
                        imageProvider:
                            const AssetImage("assets/google_logo.png"),
                        text: 'Sign in with Google',
                        onPressed: () async {
                          final user = await Authentication.signInWithGoogle(
                            context: context,
                          );
                          if (user != null) {
                            Navigator.popAndPushNamed(
                              context,
                              MainMenuPage.name,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
