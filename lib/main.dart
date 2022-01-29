import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kofe_vkusno/ui/shared/main_layout.dart';
import 'package:kofe_vkusno/ui/shared/qr_layout.dart';
import 'package:kofe_vkusno/ui/shared/cup_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF1F1005),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFFFFF7e5),
        )
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const MainLayout(),
        '/qr-scanner' : (context) => const QRLayout(),
        '/cup' : (context) => const CupLayout(),
      },
      //home: const MainLayout(),
    );
  }
}
