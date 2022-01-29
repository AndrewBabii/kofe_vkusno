import 'package:flutter/material.dart';

class CoffeeLogo extends StatelessWidget{

  const CoffeeLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 40,
      padding: const EdgeInsets.symmetric(
          vertical: 1.5, horizontal: 7),
      decoration: const BoxDecoration(
          color:  Color(0xFFDAC6AF),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow:  [
            BoxShadow(
                color: Color(0xFFDAC6AF),
                offset: Offset(0, 0),
                spreadRadius: 4,
                blurRadius: 4)
          ]),
      child: Row(
        children: [
          Image.asset(
            'resources/images/app_bar_logo.png',
          ),
          const Spacer(),
          const Text(
            'Кофе\nВкусно',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.5,
                fontSize: 12,
                fontFamily: 'Pacifico'),
          ),
        ],
      ),
    );
  }

}
