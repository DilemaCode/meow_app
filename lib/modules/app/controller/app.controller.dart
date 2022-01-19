import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/common/dependency_injection.dart';
import 'package:meow_app/core/themes/colors.dart';
import 'package:meow_app/core/themes/theme.dart';

class AppController extends GetxController {
  static var instance = locator<AppController>();
  RxBool isDarkMode = Get.isDarkMode.obs;

  bool get isDarkMode1 => Get.isDarkMode;
  
  goDark() {
    Get.changeTheme(darkTheme);
    Get.changeThemeMode(ThemeMode.dark);
    isDarkMode.value = true;
  }

  goLight() {
    Get.changeTheme(lightTheme);
    Get.changeThemeMode(ThemeMode.light);
    isDarkMode.value = false;
  }

  void errorSnackbar({bool? noInternet}) {
    String title = noInternet ?? false ? 'No internet connection' : 'Error';
    String message = noInternet ?? false
        ? 'Please check your connection and try again'
        : 'An error occurred, please try again later';

    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        backgroundColor: AppColors.primaryColor.withOpacity(0.5),
      );
    }
  }

  Future playMeow() async {
    try {
      AudioCache player = AudioCache(prefix: 'assets/audio/');
      player.play('meow.mp3', volume: 0.7);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
