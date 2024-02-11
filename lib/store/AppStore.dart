import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colors.dart';
import '../utils/constant.dart';

class AppStore extends GetxController {
  RxBool isDarkModeOn = false.obs;
  RxBool isHover = false.obs;
  Rx<Color> scaffoldBackground = Colors.white.obs;
  Rx<Color> backgroundColor = Colors.black.obs;
  Rx<Color> backgroundSecondaryColor = appSecondaryBackgroundColor.obs;
  Rx<Color> textPrimaryColor = appTextColorPrimary.obs;
  Rx<Color> appColorPrimaryLightColor = appColorPrimaryLight.obs;
  Rx<Color> textSecondaryColor = appTextColorSecondary.obs;
  Rx<Color> appBarColor = Colors.white.obs;
  Rx<Color> iconColor = iconColorPrimary.obs;
  Rx<Color> iconSecondaryColor = iconColorSecondary.obs;
  int selectedDrawerItem = -1.obs;

  void toggleDarkMode({bool? value}) {
    isDarkModeOn.value = value ?? !isDarkModeOn.value;

    if (isDarkModeOn.value) {
      scaffoldBackground.value = appBackgroundColorDark;
      appBarColor.value = Colors.white;
      backgroundColor.value = Colors.white;
      backgroundSecondaryColor.value = Colors.white;
      appColorPrimaryLightColor.value = cardBackgroundBlackDark;
      iconColor.value = iconColorPrimary;
      iconSecondaryColor.value = iconColorSecondary;
      textPrimaryColor.value = whiteColor;
      textSecondaryColor.value = Colors.white54;
    } else {
      scaffoldBackground.value = whiteColor;
      appBarColor.value = primaryColor;
      backgroundColor.value = Colors.black;
      backgroundSecondaryColor.value = appSecondaryBackgroundColor;
      appColorPrimaryLightColor.value = appColorPrimaryLight;
      iconColor.value = iconColorPrimaryDark;
      iconSecondaryColor.value = iconColorSecondaryDark;
      textPrimaryColor.value = appTextColorPrimary;
      textSecondaryColor.value = appTextColorSecondary;
    }
    setStatusBarColor(scaffoldBackground.value);
    setValue(isDarkModeOnPref, isDarkModeOn.value);
  }

  void toggleHover({bool value = false}) {
    isHover.value = value;
  }

  void setDrawerItemIndex(int aIndex) {
    selectedDrawerItem = aIndex;
  }
}
