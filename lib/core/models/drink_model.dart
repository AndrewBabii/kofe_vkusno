import 'package:kofe_vkusno/core/models/beverage.dart';

class DrinkModel extends Beverage{
  final String type;

  DrinkModel({
    required int id,
    required String picture,
    required String name,
    required String description,
    required this.type,
  }) : super(
    id : id,
    picture: picture,
    name : name,
    description: description
  );

  factory DrinkModel.fromJson(Map<String, dynamic> json){
    return DrinkModel(
      id: json['id'],
      picture: "${json['picture']}.png",
      name: json['name'],
      description: json['description'],
      type: json['type']
    );
  }


}