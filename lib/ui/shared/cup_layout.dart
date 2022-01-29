import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/ui/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:kofe_vkusno/ui/shared/widgets/coffee_drawer.dart';
import 'package:kofe_vkusno/ui/shared/widgets/cup_layout_widgets/circle_button.dart';
import 'package:kofe_vkusno/ui/shared/widgets/cup_layout_widgets/cup_indicator.dart';

import '../../providers.dart';

class CupLayout extends ConsumerWidget{
  const CupLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(cupProvider.notifier).getCountCups(); //for init current count cups from storage

    var countCups = ref.watch(cupProvider);

    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: coffeeDrawer,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                CircleButton(icon: Icons.arrow_back, onPressed: () => Navigator.of(context).pop()),
                const Spacer(),
                CircleButton(icon: Icons.home, onPressed: () => Navigator.of(context).popAndPushNamed('/')),
              ],
            ),
          ),
          Container(
            width: 320,
            color: const Color(0xFFFFF7e5),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                    'Купи пять чашек кофе и\nполучи шестую в подарок!',
                  style: TextStyle(
                    color: Color(0xFF422712),
                    fontSize: 18,
                    fontFamily: 'Pacifico'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child:  Wrap(
                        children: List.generate(5,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: CupIndicator(
                                    backgroundColor: index < countCups! ? const Color(0xFFFEF750) : const Color(0xFFFFFFFF),
                                    isBig: false,
                            ),
                                )),
                      )
                  ),
                const SizedBox(height: 20),
                Container(width: 40, height: 3, color: const Color(0xFF1F1005)),
                const SizedBox(height: 15),
                Container(width: 40, height: 3, color: const Color(0xFF1F1005)),
                const SizedBox(height: 20),
                CupIndicator(
                  backgroundColor: ref.watch(cupProvider.notifier).isMaxCup() ? const Color(0xFFFEF750) : const Color(0xFFFFFFFF) ,
                  isBig: true,
                ),
                const SizedBox(height: 30),
              ],
            ),
          )
        ],
      )
    );
  }

}
