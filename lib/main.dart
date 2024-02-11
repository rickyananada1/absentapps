import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import 'app/app.dart';
import 'core/service_locator.dart';
import 'utils/constant.dart';

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  Intl.defaultLocale = 'id';
  initializeDateFormatting();
  await setUpServiceLocator();
  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  runApp(const App());
}
