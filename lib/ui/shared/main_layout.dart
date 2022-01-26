import 'package:flutter/material.dart';

import 'widgets/app_bar_custom/app_bar_custom.dart';

class MainLayout extends StatelessWidget{
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const Drawer(
        backgroundColor: Color(0xFFFFF7e5),
      ),
      backgroundColor: const Color(0xFF1F1005),
      body: Padding(
        padding:  const EdgeInsets.fromLTRB(8, 40, 8, 26),
        child: Column(
        ),
      ),
    );
  }

}