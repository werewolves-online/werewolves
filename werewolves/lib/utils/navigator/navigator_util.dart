import 'package:flutter/material.dart';
import 'package:werewolves/constants/page_names.dart';
import 'package:werewolves/ui/pages/about_us/about_us.dart';
import 'package:werewolves/ui/pages/main_menu/main_menu.dart';
import 'package:werewolves/utils/navigator/navigator_stack.dart';

//This is a very dumb implementation, we need to add push AND pops
class NavigatorUtil {
  static navigate(context, route) {
    switch (route) {
      case PageNames.mainMenu:
        proceed(context, MainMenuPage(), PageNames.mainMenu);
        break;
      case PageNames.startGame:
        // navigate(context, StartGamePage(), PageNames.startGame);
        break;
      case PageNames.joinGame:
        // navigate(context, JoinGamePage(), PageNames.joinGame);
        break;
      case PageNames.aboutUs:
        proceed(context, AboutUsPage(), PageNames.aboutUs);
        break;
      case PageNames.supportUs:
        // navigate(context, SupportUsPage, PageNames.supportUs);
        break;
      default:
    }
  }

  static proceed(context, Widget pageToOpenWidget, nameOfPageToOpen) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => pageToOpenWidget));
    NavigatorStack.put(nameOfPageToOpen);
  }

  static goBack(context) {
    Navigator.pop(context);
    NavigatorStack.pop();
  }
}
