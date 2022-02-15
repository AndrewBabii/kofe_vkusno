import 'package:kofe_vkusno/core/models/beverage.dart';

abstract class BeverageRepository {
  Future<List<Beverage>> getBeverageList();
}

