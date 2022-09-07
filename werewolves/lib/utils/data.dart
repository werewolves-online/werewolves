import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:werewolves/model/player.dart';
import 'package:werewolves/model/room.dart';
import 'package:werewolves/utils/authentication.dart';

import '../model/game.dart';

class FirestoreHelper {
  static const String roomsCollection = 'rooms';
  static const String playersCollection = 'players';
  static const String gamesCollections = 'games';
  static Future<void> createOrUpdateRoom(Room room) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection(roomsCollection)
        .doc(room.uid)
        .set(room.doc, SetOptions(merge: true));
    for (Player player in room.players.keys) {
      await firestore
          .collection(roomsCollection)
          .doc(room.uid)
          .collection('players')
          .doc(player.playerUid)
          .set({
        'uid': player.playerUid,
        'permission': room.players[player].toString(),
      }, SetOptions(merge: true));
      await _addRoomToPlayer(player, room);
    }
  }

  static Future<void> _addRoomToPlayer(Player player, Room room) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection(playersCollection)
        .doc(player.playerUid)
        .collection(roomsCollection)
        .doc(room.uid)
        .set({});
  }

  static Future<Room?> getRoomFromUid(String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> roomDoc =
        await firestore.collection(roomsCollection).doc(uid).get();
    if (roomDoc.data() == null) {
      throw 'no data found for room $uid';
    }
    return Room.fromDoc(roomDoc.data()!);
  }

  static Future<Game?> getGameFromUid(String roomId, String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot<Map<String, dynamic>> gameDoc = await firestore
        .collection(roomsCollection)
        .doc(roomId)
        .collection(gamesCollections)
        .doc(uid)
        .get();
    if (gameDoc.data() == null) {
      throw 'no data found for game $uid';
    }
    return Game.fromDoc(gameDoc.data()!);
  }

  static Stream<List<String>> playerRoomsSnapshots() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? uid = Authentication.currentUserUid();
    if (uid == null) {
      throw 'user is not logged in';
    }
    return firestore
        .collection(playersCollection)
        .doc(uid)
        .collection(roomsCollection)
        .snapshots()
        .map((event) => event.docs.map((e) => e.id).toList());
  }

  static Stream<List<String>> roomGamesSnapshots(String uid) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection(roomsCollection)
        .doc(uid)
        .collection(gamesCollections)
        .snapshots()
        .map((event) => event.docs.map((e) => e.id).toList());
  }
}
