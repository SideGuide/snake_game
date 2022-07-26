import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/snake.dart';
import '../model/user.dart';

class UserService extends ChangeNotifier {
  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? user = prefs.getBool('userCreated');
    if (user != true) {
      await prefs.setBool('userCreated', true);
      await prefs.setInt('highScore', 0);
      await prefs.setInt('coins', 0);
      await prefs.setString('currentSnake', "default");
      await prefs.setString('currentBoard', "default");
      await prefs.setStringList('snakesIds', ["0"]);
      await prefs.setStringList('boardsIds', ["0"]);
      return User(
          userCreated: true,
          highScore: 0,
          coins: 0,
          currentSnake: "default",
          currentBoard: "default",
          snakesIds: ["0"],
          boardsIds: ["0"]);
    } else {
      final userCreated = prefs.getBool('userCreated') ?? false;
      final highScore = prefs.getInt('highScore') ?? 0;
      final coins = prefs.getInt('coins') ?? 0;
      final currentSnake = prefs.getString('currentSnake') ?? "default";
      final currentBoard = prefs.getString('currentBoard') ?? "default";
      final snakesIds = prefs.getStringList('snakesIds') ?? ["0"];
      final boardsIds = prefs.getStringList('boardsIds') ?? ["0"];
      return User(
        boardsIds: boardsIds,
        userCreated: userCreated,
        coins: coins,
        highScore: highScore,
        snakesIds: snakesIds,
        currentBoard: currentBoard,
        currentSnake: currentSnake,
      );
    }
  }

  Future<void> updatePreferences(Snake snake) async {
    final user = await getUser();
    if (snake.score > user.highScore) {
      updateHighScore(snake.score);
    }
    updateCoins(snake.coins);
    notifyListeners();
  }

  Future<void> updateHighScore(int newHighScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("highScore", newHighScore);
  }

  Future<void> updateCoins(int coins) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? oldCoins = prefs.getInt("coins");
    int newCoins = coins + (oldCoins ?? 0);
    prefs.setInt("coins", newCoins);
  }
}
