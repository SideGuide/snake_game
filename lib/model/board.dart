import 'package:flutter/material.dart';

class Board {
  String? id;
  Color color;
  String name;
  int price;

  Board({
    this.id,
    required this.color,
    required this.name,
    required this.price,
  });
}
