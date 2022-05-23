class GameInformationModel {
  String gameName = "";

  GameInformationModel(this.gameName);

  static GameInformationModel fromModel(GameInformationModel otherModel) {
    return GameInformationModel(otherModel.gameName);
  }

  static GameInformationModel static() {
    return GameInformationModel("");
  }
}
