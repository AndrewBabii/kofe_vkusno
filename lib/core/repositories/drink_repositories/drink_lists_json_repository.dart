import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kofe_vkusno/core/models/beverage.dart';
import 'package:kofe_vkusno/core/models/drink_model.dart';
import 'package:kofe_vkusno/core/repositories/drink_repositories/beverage_repository.dart';

class DrinkListJsonRepository extends BeverageRepository{
  @override
  Future<List<Beverage>> getBeverageList() async {
    String json = await rootBundle.loadString('beverages.json');
    List<dynamic> temp = jsonDecode(json);
    return temp.map((e) => DrinkModel.fromJson(e)).toList();
  }

}