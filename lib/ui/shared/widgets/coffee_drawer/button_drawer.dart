import 'package:flutter/material.dart';

class ButtonDrawer extends StatelessWidget {
  final String label;
  final String routName;

  const ButtonDrawer({
    Key? key,
    required this.label,
    required this.routName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).popAndPushNamed(routName);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Pacifico',
                  color: Color(0xFF000000),
                )),
            const SizedBox(height: 8),
            const Divider(height: 0, color: Colors.black)
          ]),
        ));
  }
}
