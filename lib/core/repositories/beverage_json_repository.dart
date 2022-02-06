import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kofe_vkusno/core/models/beverage.dart';
import 'package:kofe_vkusno/core/repositories/beverage_repository.dart';


class BeverageJSONRepository extends BeverageRepository{
  @override
  Future<List<Beverage>> getBeverageList() async {
    String json = await rootBundle.loadString('beverages.json');
    List<dynamic> temp = jsonDecode(json);
    return temp.map((e) => Beverage.fromJson(e)).toList();
  }

}