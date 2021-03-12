import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tech_titans/core/app_preference.dart';
import 'package:tech_titans/core/push_notification/src/notification_show/notification_helper.dart';
import 'package:tech_titans/providers/auth_provider.dart';
import 'package:tech_titans/providers/theme_provider.dart';
import 'package:tech_titans/routes.dart';
import 'package:tech_titans/screens/home_page/home_page.dart';
import 'package:tech_titans/screens/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  User? user = await AppPreference.fetchUserSetting();
  await LocalNotificationHelper.setup();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(user: user),
    ),
  ], child: new MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Consumer2<ThemeProvider, AuthProvider>(
      builder: (_, themeProvider, authProvider, child) {
        print(authProvider.isAuth);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          title: 'Flutter Demo',
          theme: themeProvider.appTheme(),
          darkTheme: themeProvider.appTheme(isSystemDarkMode: true),
          routes: PageRoutes.routes,
          home: authProvider.isAuth ? MyHomePage() : LoginPage(),
        );
      },
    );
  }
}
