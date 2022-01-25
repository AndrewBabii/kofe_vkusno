import 'package:flutter/material.dart';

import 'coffee_logo.dart';
import 'drawer_icon_button.dart';

class AppBarCustom extends PreferredSize {
  const AppBarCustom({Key? key})
      : super(
            key: key,
            child: const _AppBarCustomBody(),
            preferredSize: const Size.fromHeight(80));
}

class _AppBarCustomBody extends StatelessWidget {
  const _AppBarCustomBody({Key? key}) : super(key: key);

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
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                const Positioned(
                  left: 30,
                  child: DrawerIconButton()
                ),
                Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: CoffeeLogo(onTap: () {

                  })
                ),
              ],
            )
          ]),
    );
  }
}
