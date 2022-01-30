import 'package:flutter/material.dart';

@immutable
class Beverage {
  final int id;
  final ImageProvider picture;
  final String name;
  final String description;

  Beverage({required this.id, required String picture, required this.name, required this.description})
      :picture = AssetImage(picture);

  Beverage.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        picture = AssetImage("resources/images/beverage/${json['picture']}.png"),
        name = json['name'],
        description = json['description'];
}