import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/core/models/drink_model.dart';
import 'package:kofe_vkusno/core/usecases/get_all_drinks_from_json.dart';

class DrinkListNotifier extends StateNotifier<List<DrinkModel>>{
  final GetAllDrinksFromJson getAllDrinksFromJson;

  DrinkListNotifier({required this.getAllDrinksFromJson}) : super([]);

  List<DrinkModel>? _fullBeverageList;

  Future<void> getDesignerCoffeeList() async {
    state = await _getDrinkListByType('designer_coffee');
  }

  Future<void> getNaturalTeaList() async {
    state = await _getDrinkListByType('natural_tea');
  }

  Future<void> getNaturalCoffeeList() async {
    state = await _getDrinkListByType('natural_coffee');
  }

  Future<List<DrinkModel>> _getDrinkListByType(String drinkType) async {
    _fullBeverageList ??= await getAllDrinksFromJson();

    return List.from(_fullBeverageList!.where((element) => element.type == drinkType));
  }
}