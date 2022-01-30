import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class DrawerIconButton extends StatelessWidget {
  const DrawerIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0x00000000),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'resources/icons/menu_icon.svg',
              width: 23,
              height: 17,
            ),
            Text(
              'menu'.tr(),
              style: const TextStyle(fontSize: 7, fontFamily: 'Pacifico'),
            ),
          ],
        ),
      ),
    );
  }
}
