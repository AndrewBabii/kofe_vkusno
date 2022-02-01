import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CupIndicator extends StatelessWidget{
  final Color backgroundColor;
  final bool isBig;

  const CupIndicator({
    Key? key,
    required this.backgroundColor,
    required this.isBig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: isBig ? 100 :50,
        height: isBig ? 100 : 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle
        ),
        child: SvgPicture.asset(
          'resources/icons/menu_icon.svg',
          width: isBig ? 54 :27,
          height: isBig ? 44 :22,
        ),
      ),
    );
  }

}