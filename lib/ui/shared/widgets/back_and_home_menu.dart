import 'package:flutter/material.dart';
import 'package:kofe_vkusno/ui/shared/widgets/cup_screen_widgets/circle_button.dart';


class BackAndHome extends StatelessWidget {
  const BackAndHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleButton(icon: Icons.arrow_back, onPressed: () => Navigator.of(context).pop()),
        const Spacer(),
        CircleButton(icon: Icons.home, onPressed: () => Navigator.of(context).popAndPushNamed('/')),
      ],
    );
  }
}
