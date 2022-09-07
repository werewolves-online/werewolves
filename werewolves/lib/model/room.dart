import 'package:uuid/uuid.dart';
import 'package:werewolves/model/permission.dart';
import 'package:werewolves/model/player.dart';

class Room {
  static Room invalidRoom = Room._(uid: 'no_uuid', name: 'invalid room!');

  final String uid;
  String name;

  final Map<Player, Permission> players = {};

  Room._({required this.uid, Player? admin, this.name = ''}) {
    if (admin != null) {
      players[admin] = Permission.owner;
    }
  }

  static Room fromDoc(Map<String, dynamic> doc) {
    return Room._(uid: doc['uid'], name: doc['name']);
  }

  static Room createNew(String name, String currentUUID) {
    return Room._(
      uid: const Uuid().v1(),
      admin: Player(currentUUID),
      name: name,
    );
  }

  Map<String, dynamic> get doc => {
        'name': name,
        'uid': uid,
      };
}
