import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kofe_vkusno/ui/shared/main_layout.dart';
import 'package:kofe_vkusno/ui/shared/qr_screen.dart';
import 'package:kofe_vkusno/ui/shared/cup_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(ProviderScope(
    child: EasyLocalization(
      path: 'resources/translations',
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('uk')],
      fallbackLocale: const Locale('uk'),
      child: const App(),
    ),
  ));

}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: ThemeData(
            textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFF1F1005),
            drawerTheme: const DrawerThemeData(
                backgroundColor: Color(0xFFFFF7e5),
              )
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: '/',
          routes: {
              '/' : (context) => const MainLayout(),
              '/qr-scanner' : (context) => const QRScreen(),
              '/cup' : (context) => const CupScreen(),
          },
        ),

    );
  }
}
