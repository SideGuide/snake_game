class User {
  bool userCreated;
  List<String> snakesIds;
  List<String> boardsIds;
  int coins;
  String currentSnake;
  String currentBoard;
  int highScore;

  User(
      {required this.userCreated,
      required this.boardsIds,
      required this.currentBoard,
      required this.currentSnake,
      required this.coins,
      required this.highScore,
      required this.snakesIds});

  fromMap(Map<dynamic, dynamic> map) {
    userCreated = map["userCreated"];
    snakesIds = map["snakesIds"];
    boardsIds = map["boardsIds"];
    highScore = map["highScore"];
    coins = map["score"];
    currentSnake = map["currentSnake"];
    currentBoard = map["currentBoard"];
  }
}
