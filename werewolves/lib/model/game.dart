class Game {
  final String uid;
  String name;

  Game._({required this.uid, this.name = ''});

  static Game fromDoc(Map<String, dynamic> doc) {
    return Game._(uid: doc['uid'], name: doc['name']);
  }
}
