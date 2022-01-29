import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers.dart';

final coffeeDrawer = Drawer(
    //backgroundColor: const Color(0xFFFFF7e5),
    child: Column(children: const [
        SizedBox(height: 120),
        ButtonDrawer(textButton: 'Отсканировать код', routName: '/qr-scanner'),
        ButtonDrawer(textButton: 'Бессплатная чашка', routName: '/cup'),
        TestZeroCupButtonDrawer()
      ]
    )
);

class ButtonDrawer extends StatelessWidget{
  final String textButton;
  final String routName;

  const ButtonDrawer({Key? key, required this.textButton, required this.routName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed(routName);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textButton,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Pacifico',
                          color: Color(0xFF000000),
                      )
                  ),
                const SizedBox(height: 8),
                const Divider(height: 0, color: Colors.black)
              ]
            ),
          )
    );
  }

}

class TestZeroCupButtonDrawer extends ConsumerWidget{

  const TestZeroCupButtonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () {
          ref.watch(cupProvider.notifier).zeroCups();
          Navigator.of(context).pop();
        },
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(const Size.fromWidth(double.maxFinite)),
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1F1005)),

        ),
        child: const Text(
          'Обнулить колличество чашек',
          style: TextStyle(
              color: Color(0xFFFFF7e5),
              fontStyle: FontStyle.italic
          ),
        )
    );
  }

}