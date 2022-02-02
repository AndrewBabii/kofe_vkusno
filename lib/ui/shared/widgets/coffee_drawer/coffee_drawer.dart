import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/providers.dart';
import 'package:kofe_vkusno/ui/shared/widgets/coffee_drawer/button_drawer.dart';

final coffeeDrawer = Drawer(
    child: Column(children: const [
  SizedBox(height: 120),
  ButtonDrawer(label: 'Отсканировать код', routName: '/qr-scanner'),
  ButtonDrawer(label: 'Бесплатная чашка', routName: '/cup'),
  ButtonDrawer(label: 'Map Screen', routName: '/mapScreen'),
  TestZeroCupButtonDrawer()
]));

class TestZeroCupButtonDrawer extends ConsumerWidget {
  const TestZeroCupButtonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () {
          ref.watch(cupProvider.notifier).zeroCups();
          Navigator.of(context).pop();
        },
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(
              const Size.fromWidth(double.maxFinite)),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFF1F1005)),
        ),
        child: const Text(
          'Обнулить колличество чашек',
          style: TextStyle(
              fontSize: 18,
              color: Color(0xFFFFF7e5),
              fontStyle: FontStyle.italic),
        ));
  }
}
