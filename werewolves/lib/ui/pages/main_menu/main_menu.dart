import 'package:flutter/material.dart';
import 'package:werewolves/model/room.dart';
import 'package:werewolves/ui/login.dart';
import 'package:werewolves/ui/pages/create_room.dart';
import 'package:werewolves/ui/pages/room_page.dart';
import 'package:werewolves/ui/widgets/stream_loadable_list.dart';
import 'package:werewolves/ui/widgets/title_scaffold.dart';
import 'package:werewolves/utils/authentication.dart';
import 'package:werewolves/utils/data.dart';

class MainMenuPage extends StatelessWidget {
  static const String name = 'main_menu';
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleScaffold(
      title: 'Werewolves',
      actions: [
        IconButton(
            onPressed: () async {
              await Authentication.signOut(
                context: context,
              );
              Navigator.popAndPushNamed(context, LoginPage.name);
            },
            icon: const Icon(Icons.logout)),
      ],
      body: StreamLoadableList(
        extraItems: [
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, CreateRoom.name);
            },
            title: const Text('Add Room'),
            subtitle: const Text('press to create and manage a new room'),
          ),
        ],
        itemBuilder: (BuildContext context, String item) {
          return roomItem(item);
        },
        stream: FirestoreHelper.playerRoomsSnapshots(),
      ),
    );
  }

  Widget roomItem(String roomUid) {
    return FutureBuilder<Room?>(
      builder: ((context, snapshot) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        if (!snapshot.hasData) return Text('loading $roomUid');
        Room? room = snapshot.data;
        if (room == null) {
          return Text('room $roomUid failed to load');
        }
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, RoomPage.name, arguments: room);
          },
          title: Text(room.name),
          subtitle: Text(room.uid),
        );
      }),
      future: FirestoreHelper.getRoomFromUid(roomUid),
    );
  }
}
