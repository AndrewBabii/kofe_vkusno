import 'package:flutter/material.dart';
import 'package:kofe_vkusno/ui/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:kofe_vkusno/ui/shared/widgets/coffee_drawer/coffee_drawer.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1005),
      appBar: const AppBarCustom(),
      drawer: coffeeDrawer,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 40, 8, 26),
        child: child,
      ),
    );
  }
}
