import 'package:flutter/material.dart';

import 'coffee_logo.dart';
import 'drawer_icon_button.dart';

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
              children: const [
                SizedBox(width: 30),
                DrawerIconButton(),
                Spacer(),
                CoffeeLogo(),
                Spacer(),
                SizedBox(width: 53), //The width 53 consist of the indent and the width of the menu icon
              ],
            )
          ]),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(70);
}
