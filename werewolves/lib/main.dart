import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:werewolves/ui/login.dart';
import 'package:werewolves/ui/pages/about_us/about_us.dart';
import 'package:werewolves/ui/pages/create_room.dart';
import 'package:werewolves/ui/pages/join_game/join_game.dart';
import 'package:werewolves/ui/pages/main_menu/main_menu.dart';
import 'package:werewolves/ui/pages/room_page.dart';
import 'package:werewolves/ui/pages/support_us/support_us.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAonASfQoAq8GNxLMZvxmaRNv12tBcWGgs",
      authDomain: "werewolves-2e9df.firebaseapp.com",
      projectId: "werewolves-2e9df",
      storageBucket: "werewolves-2e9df.appspot.com",
      messagingSenderId: "224633962454",
      appId: "1:224633962454:web:e98681fa039d63e354ae77",
      measurementId: "G-3XFHJ2B9D2",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key("main_MaterialApp"),
      title: 'Werewolves App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: LoginPage.name,
      routes: {
        LoginPage.name: (context) => const LoginPage(),
        MainMenuPage.name: (context) => const MainMenuPage(),
        RoomPage.name: (context) => const RoomPage(),
        CreateRoom.name: ((context) => CreateRoom()),
        JoinGamePage.name: (context) => const JoinGamePage(),
        AboutUsPage.name: (context) => const AboutUsPage(),
        SupportUsPage.name: (context) => const SupportUsPage(),
      },
      home: const LoginPage(),
    );
  }
}
