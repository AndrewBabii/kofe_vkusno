import 'package:shared_preferences/shared_preferences.dart';

abstract class CupsRepository {
  Future<void> addOneCup();
  Future<int?> getCountCups();
  Future<void> zeroCups();
}

const CUPS = 'CUPS';

class CupsRepositoryImpl extends CupsRepository{
  SharedPreferences? sharedPreferences;

  int? _countCups;

  @override
  Future<void> addOneCup() async {
    await _initAndGetCountCups();

    if(_countCups != null) {
      sharedPreferences!.setInt(CUPS, _countCups! + 1);
    } else {
      await sharedPreferences!.setInt(CUPS, 1);
    }
  }

  @override
  Future<int?> getCountCups() async {
    await _initAndGetCountCups();

    if(_countCups != null) {
      return _countCups;
    } else {
      await sharedPreferences!.setInt(CUPS, 0);
      _countCups = sharedPreferences!.getInt(CUPS);

      return _countCups;
    }
  }

  @override
  Future<void> zeroCups() async {
    await _initPreferencesOrNo();
    await sharedPreferences!.setInt(CUPS, 0);
  }


  Future<void> _initPreferencesOrNo() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<void> _initAndGetCountCups() async {
    await _initPreferencesOrNo();

    _countCups = sharedPreferences!.getInt(CUPS);
  }
}