import 'package:flutter/material.dart';

class Coin {
  String? id;
  int quantity;
  String? img;
  String name;
  double price;

  Coin({
    this.id,
    required this.name,
    required this.price,
    this.img,
    required this.quantity,
  });
}
