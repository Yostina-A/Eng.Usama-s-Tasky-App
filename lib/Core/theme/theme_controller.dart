import 'package:flutter/material.dart';
import 'package:tasky/Core/services/prefences_manager.dart';

class ThemeController {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    ThemeMode.dark,
  );

  init() {
    bool isDarkMode = PrefrencesManager().getBool("isDarkMode") ?? true;
    themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static toggleTheme () async {
    if(themeNotifier.value == ThemeMode.dark){
      themeNotifier.value = ThemeMode.light;
       await PrefrencesManager().setBool("isDarkMode", false);
       } else{
        themeNotifier.value = ThemeMode.dark;
        await PrefrencesManager().setBool("isDarkMode", true);
       }
  }

  static bool isDark () => themeNotifier.value == ThemeMode.dark;
}
