import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werewolves/ui/pages/start_game/create_game_modal.dart';
import 'package:werewolves/model/game_information_model.dart';

//Formatting for the games list section (not cards)
const double gamesListMargin = 20;
const double gamesListPadding = 20;
const double spaceBetweenSavedGameTextAndGameList = 30;
const Color gamesListColor = Color.fromARGB(255, 175, 175, 225);
const TextStyle savedGamesTextStyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

//Formatting for games list cards
const double cardPadding = 25;
const TextStyle cardTextStyle = TextStyle(fontSize: 20);

class StartGamePage extends StatefulWidget {
  const StartGamePage({Key? key}) : super(key: key);

  static const String name = 'create_game';

  @override
  State<StartGamePage> createState() => _StartGamePage();
}

class _StartGamePage extends State<StartGamePage> {
  late CreateGameModal modal;

  @override
  void initState() {
    super.initState();
    modal = CreateGameModal(addGameToSavedGames);
  }

  List<GameInformationModel> testGameData = [
    GameInformationModel('PLACE_HOLDER_TEXT_1')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Start Game')),
        body: Column(
          children: [
            SizedBox(
                height: 400,
                child: Container(
                    margin: const EdgeInsets.all(gamesListMargin),
                    padding: const EdgeInsets.all(gamesListPadding),
                    color: gamesListColor,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0,
                                  spaceBetweenSavedGameTextAndGameList),
                              child: const Text('Your Saved Games',
                                  style: savedGamesTextStyle)),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Column(children: getSavedGames())))
                        ]))),
            CupertinoButton.filled(
                child: const Text("Create New Game"),
                onPressed: () => openCreateNewGameModal(context))
          ],
        ));
  }

  openCreateNewGameModal(BuildContext context) {
    return showGeneralDialog(
      barrierColor: const Color.fromARGB(200, 70, 70, 70),
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return modal;
      },
    );
  }

  addGameToSavedGames(GameInformationModel game) {
    List<GameInformationModel> currList = testGameData;
    currList.add(game);
    setState(() {
      testGameData = currList;
    });
  }

  List<Widget> getSavedGames() {
    List<Widget> savedGames = [];

    for (GameInformationModel gameModel in testGameData) {
      savedGames.add(getSavedGameTile(gameModel.gameName));
    }
    return savedGames;
  }

  Card getSavedGameTile(String text) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(cardPadding),
            child: Row(
              children: [
                Text(
                  text,
                  style: cardTextStyle,
                )
              ],
            )));
  }
}
