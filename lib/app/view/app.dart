import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/screens/dashboard_screen.dart';
import '../../presentation/screens/login_screen.dart';
import '../../store/AppStore.dart';
import '../../utils/AppTheme.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
AppStore appStore = AppStore();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sistem Retribusi Air Minum',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: appStore.isDarkModeOn.value ? ThemeMode.dark : ThemeMode.light,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
      ],
    );
  }
}
