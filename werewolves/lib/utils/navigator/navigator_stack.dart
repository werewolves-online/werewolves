import 'package:werewolves/constants/page_names.dart';

class NavigatorStack {
  static var pageStack = <PageNames>[PageNames.mainMenu];

  static currentPage() {
    if (pageStack.isEmpty) {
      return null;
    }
    return pageStack[pageStack.length - 1];
  }

  static previousPage() {
    if (pageStack.length < 2) {
      return null;
    }
    return pageStack[pageStack.length - 2];
  }

  static put(PageNames page) {
    pageStack.add(page);
  }

//TODO: with the automatic AppBar back arrow seeming to run Navigator.pop() and not using my NavigatorUtil, the stack will not by in
//sync to what pages are on the stack, so this needs a remedy or this stacks needs to be removed
  static pop() {
    pageStack.removeLast();
  }
}
