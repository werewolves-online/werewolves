class Permission {
  static Permission member = Permission._(
    canCreateGame: false,
    stringValue: 'member',
  );
  static Permission admin = Permission._(
    canCreateGame: true,
    stringValue: 'admin',
  );
  static Permission moderator = Permission._(
    canCreateGame: true,
    stringValue: 'moderator',
  );
  static Permission owner = Permission._(
    canCreateGame: true,
    stringValue: 'owner',
  );

  Permission._({required this.canCreateGame, required this.stringValue});

  final bool canCreateGame;
  final String stringValue;

  @override
  String toString() {
    return stringValue;
  }
}
