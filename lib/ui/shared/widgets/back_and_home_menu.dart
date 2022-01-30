import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kofe_vkusno/ui/shared/main_layout.dart';

class BackAndHome extends StatelessWidget {
  const BackAndHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: FloatingActionButton(
            child: SizedBox(
              width: 21.0,
              height: 21.0,
              child: SvgPicture.asset(
                "resources/icons/back_icon.svg",
              ),
            ),
            backgroundColor: const Color(0xFF422712),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        SizedBox(
          width: 30,
          height: 30,
          child: FloatingActionButton(
            child: SizedBox(
              width: 18.0,
              height: 18.0,
              child: SvgPicture.asset(
                "resources/icons/home_icon.svg",
              ),
            ),
            backgroundColor: const Color(0xFF422712),
            onPressed: () => Navigator.push(context, MainLayout.route()),
          ),
        ),
      ],
    );
  }
}
