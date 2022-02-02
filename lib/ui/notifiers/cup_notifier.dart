import 'package:kofe_vkusno/ui/usecases/cup_usecases/add_one_cup.dart';
import 'package:kofe_vkusno/ui/usecases/cup_usecases/get_count_cups.dart';
import 'package:kofe_vkusno/ui/usecases/cup_usecases/zero_cups.dart';
import 'package:state_notifier/state_notifier.dart';

class CupNotifier extends StateNotifier<int?>{
  final AddOneCup callAddOneCup;
  final GetCountCups callGetCountCups;
  final ZeroCups callZeroCups;

  CupNotifier(int state, {
    required this.callAddOneCup,
    required this.callGetCountCups,
    required this.callZeroCups,
  }) : super(state);

  void addOneCup() async {
    await callAddOneCup();
  }

  void getCountCups() async {
    state = await callGetCountCups();
  }

  void zeroCups() async{
    await callZeroCups();
    state = 0;
  }

  bool isMaxCup(){
    if(state == 5) {
      return true;
    } else {
      return false;
    }
  }

}