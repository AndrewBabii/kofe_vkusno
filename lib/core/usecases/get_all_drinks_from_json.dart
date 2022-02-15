import 'package:kofe_vkusno/core/models/drink_model.dart';
import 'package:kofe_vkusno/core/repositories/drink_repositories/beverage_repository.dart';
import 'package:kofe_vkusno/core/usecases/load_from_json_usecase.dart';

class GetAllDrinksFromJson extends LoadFromJsonUsecase<DrinkModel>{
  final BeverageRepository repository;

  GetAllDrinksFromJson({required this.repository});

  @override
  Future<List<DrinkModel>> call() async {
    return (await repository.getBeverageList() as List<DrinkModel>);
  }

}