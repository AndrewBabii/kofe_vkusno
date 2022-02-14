import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/core/models/drink_model.dart';
import 'package:kofe_vkusno/core/notifiers/cup_notifier.dart';
import 'package:kofe_vkusno/core/notifiers/drink_list_notifier.dart';
import 'package:kofe_vkusno/core/repositories/cups_repository.dart';
import 'package:kofe_vkusno/core/repositories/drink_repositories/beverage_repository.dart';
import 'package:kofe_vkusno/core/repositories/drink_repositories/drink_lists_json_repository.dart';
import 'package:kofe_vkusno/core/usecases/cup_usecases/add_one_cup.dart';
import 'package:kofe_vkusno/core/usecases/cup_usecases/get_count_cups.dart';
import 'package:kofe_vkusno/core/usecases/cup_usecases/zero_cups.dart';
import 'package:kofe_vkusno/core/usecases/get_all_drinks_from_json.dart';



//cups Repository
final cupsRepositoryProvider = Provider<CupsRepository>((ref) => CupsRepositoryImpl());

//cup usecases
final addOneCupProviderUseCase = Provider<AddOneCup>((ref) => AddOneCup(repository: ref.watch(cupsRepositoryProvider)));

final getCountCupsProviderUseCase = Provider<GetCountCups>((ref) => GetCountCups(repository: ref.watch(cupsRepositoryProvider)));

final zeroCupsProviderUseCase = Provider<ZeroCups>((ref) => ZeroCups(repository: ref.watch(cupsRepositoryProvider)));

//cup Notifier
final cupProvider = StateNotifierProvider<CupNotifier, int?>((ref) =>
    CupNotifier(-1,
        callAddOneCup: ref.watch(addOneCupProviderUseCase),
        callGetCountCups: ref.watch(getCountCupsProviderUseCase),
        callZeroCups: ref.watch(zeroCupsProviderUseCase)));




//drink from Json Repository
final drinkListRepository = Provider<BeverageRepository>((_) => DrinkListJsonRepository());

//drink from Json usecase
final getAllDrinksFromJsonProviderUseCase = Provider<GetAllDrinksFromJson>((ref) => GetAllDrinksFromJson(
    repository: ref.watch(drinkListRepository)));

//drink list notifier
final drinksListProvider = StateNotifierProvider<DrinkListNotifier, List<DrinkModel>?>((ref) =>
    DrinkListNotifier(getAllDrinksFromJson: ref.watch(getAllDrinksFromJsonProviderUseCase)));





