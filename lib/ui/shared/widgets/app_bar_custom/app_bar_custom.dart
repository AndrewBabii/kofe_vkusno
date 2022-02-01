import 'package:flutter/material.dart';
import 'package:kofe_vkusno/ui/shared/widgets/app_bar_custom/coffee_logo.dart';
import 'package:kofe_vkusno/ui/shared/widgets/app_bar_custom/drawer_icon_button.dart';



class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPhonePadding = MediaQuery.of(context).padding.top;

    return Container(
      height: double.maxFinite,
      color: const Color(0xFFFFF7e5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topPhonePadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 30),
                DrawerIconButton(),
                CoffeeLogo(),
                SizedBox(width: 53), //The width 53 consist of the indent and the width of the menu icon
              ],
            )
          ]),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(70);
}
