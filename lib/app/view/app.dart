import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/screens/attendance_screen.dart';
import '../../presentation/screens/dashboard_screen.dart';
import '../../presentation/screens/face_register_screen.dart';
import '../../presentation/screens/face_scan_screen.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/on_boarding_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/success_screen.dart';
import '../../store/AppStore.dart';
import '../../utils/app_theme.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
AppStore appStore = AppStore();

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Absent Apps',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: appStore.isDarkModeOn.value ? ThemeMode.dark : ThemeMode.light,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/onboarding', page: () => const OnBoardingScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/face_register', page: () => const FaceRegisterScreen()),
        GetPage(name: '/face_scan', page: () => const FaceScanScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
        GetPage(name: '/attendance', page: () => const AttendanceScreen()),
        GetPage(name: '/success', page: () => const SuccessScreen()),
      ],
    );
  }
}
