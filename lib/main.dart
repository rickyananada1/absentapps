import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'core/service_locator.dart';
import 'domain/entities/user_model.dart';
import 'utils/constant.dart';
import 'utils/http_override.dart';

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  Intl.defaultLocale = 'id';
  initializeDateFormatting();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(UserAdapter());
  await setUpServiceLocator();
  HttpOverrides.global = MyHttpOverrides();
  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const App());
}
