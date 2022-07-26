import 'package:flutter/material.dart';

class Snake {
  List<int> positions;
  String name;
  Color color;
  int score;
  int coins;

  String? direction; // "up", "down", "left", "right"
  String? id;
  String? image;
  int? price;
  int? diamonds;

  Snake(
      {required this.positions,
      required this.color,
      required this.name,
      this.score = 0,
      this.direction,
      this.image,
      this.price,
      this.id,
      this.coins = 0,
      this.diamonds});
}
