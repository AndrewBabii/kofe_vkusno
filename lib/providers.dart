import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/core/notifiers/cup_notifier.dart';
import 'package:kofe_vkusno/core/repositories/cups_repository.dart';
import 'package:kofe_vkusno/core/usecases/cup_usecases/add_one_cup.dart';
import 'package:kofe_vkusno/core/usecases/cup_usecases/get_count_cups.dart';
import 'package:kofe_vkusno/core/usecases/cup_usecases/zero_cups.dart';



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
