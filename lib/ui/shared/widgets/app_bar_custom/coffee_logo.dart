import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

const BorderRadius logoRadius = BorderRadius.all(Radius.circular(10));
//
const Size logoSize = Size(116, 40);

class CoffeeLogo extends StatelessWidget {
  final Function onTap;

  const CoffeeLogo({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: logoSize.width,
          height: logoSize.height,
          padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 7),
          decoration: const BoxDecoration(
            color: Color(0xFFDAC6AF),
            borderRadius: logoRadius,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFDAC6AF),
                offset: Offset(0, 0),
                spreadRadius: 4,
                blurRadius: 4,
              )
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                'resources/images/app_bar_logo.png',
              ),
              const Spacer(),
              Text(
                'Кофе\nВкусно'.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.5,
                  fontSize: 12,
                  fontFamily: 'Pacifico',
                ),
              ),
            ],
          )),
      SizedBox(
        width: logoSize.width,
        height: logoSize.height,
        child: Material(
          child: InkWell(
            radius: 10,
            borderRadius: logoRadius,
            onTap: () => onTap(),
          ),
          color: const Color(0x00000000),
        ),
      ),
    ]);
  }
}
