import 'package:flutter/material.dart';

class Model {
  final String image;
  final String name;
  final String owner;
  final String description;
  final double price;
  Model(
      {required this.name,
      required this.image,
      required this.description,
      required this.owner,
      required this.price,
      Key? key});
}
