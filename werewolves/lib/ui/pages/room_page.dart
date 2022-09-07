import 'package:flutter/material.dart';
import 'package:werewolves/model/room.dart';
import 'package:werewolves/ui/widgets/title_scaffold.dart';

import '../../model/game.dart';
import '../../utils/data.dart';
import '../widgets/stream_loadable_list.dart';

class RoomPage extends StatelessWidget {
  static const String name = 'room';
  const RoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final room = ModalRoute.of(context)?.settings.arguments as Room;
    return TitleScaffold(
      title: room.name,
      body: StreamLoadableList(
        extraItems: [
          ListTile(
            onTap: () {
              // TODO navigate to create a game page
            },
            title: const Text('New Game'),
            subtitle: const Text('press to create and moderate a new game'),
          ),
        ],
        itemBuilder: (BuildContext context, String item) {
          return gameItem(room.uid, item);
        },
        stream: FirestoreHelper.roomGamesSnapshots(room.uid),
      ),
    );
  }

  Widget gameItem(String roomId, String gameUid) {
    return FutureBuilder<Game?>(
      builder: ((context, snapshot) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return Text('loading $gameUid');
        Game? game = snapshot.data;
        if (game == null) {
          return Text('game $gameUid failed to load');
        }
        return ListTile(
          onTap: () {
            // TODO open the game page
          },
          title: Text(game.name),
          subtitle: Text(game.uid),
        );
      }),
      future: FirestoreHelper.getGameFromUid(roomId, gameUid),
    );
  }
}
