import 'package:flutter/material.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(primaryContainer: Color(0xFF282828)),
  scaffoldBackgroundColor: Color(0xFF181818),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF181818),
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
  ),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0xFF15B86C);
      }
      return Colors.white;
    }),
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Color(0xFFFFFCFC);
      }
      return Color(0xFF9E9E9E);
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      return Color(0xFF9E9E9E);
    }),
    trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return 0;
      }
      return 2;
    }),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Color(0xFFFFFCFC)),
      backgroundColor: WidgetStateProperty.all(Color(0xFF15B86C)),
    ),
  ),
  // textTheme: TextTheme(
  //   displayLarge:,
  //   displayMedium:,
  //   displaySmall:,
  //   headlineLarge:,
  //   headlineMedium:,
  //   headlineSmall:,
  //   titleLarge:,
  //   titleMedium:,
  //   titleSmall:,
  //   bodyLarge:,
  //   bodyMedium:,
  //   bodySmall:,
  //   labelLarge:,
  //   labelMedium:,
  //   labelSmall:,
  // ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color(0xFF6D6D6D),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    filled: true,
    fillColor: Color(0xFF282828),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: Color(0xff6E6E6E), width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),
  // TODO: adjust dark theme styles
  extensions: [
    TextStyles(
      titleOne: TextStyle(
        color: Color(0xffFFFCFC),
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      titleTwo: TextStyle(
        color: Color(0xffFFFCFC),
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      titleThree: TextStyle(
        color: Color(0xffFFFCFC),
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      screenTitle: TextStyle(
        color: Color(0xffFFFCFC),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyOne: TextStyle(
        color: Color(0xffFFFCFC),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyTwo: TextStyle(
        color: Color(0xffFFFCFC),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      textFieldHint: TextStyle(
        color: Color(0xff6D6D6D),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      secondaryText1: TextStyle(
        color: Color(0xffC6C6C6),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      secondaryText2: TextStyle(
        color: Color(0xffC6C6C6),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      secondaryText3: TextStyle(
        color: Color(0xffC6C6C6),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      undoneTask: TextStyle(
        color: Color(0xffFFFCFC),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      doneTask: TextStyle(
        color: Color(0xffA0A0A0),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
        decoration: TextDecoration.lineThrough,
        decorationColor: Color(0xffA0A0A0),
      ),
      primaryButtonText: TextStyle(
        color: Color(0xffFFFCFC),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      highPriorityTasksTitle: TextStyle(
        color: Color(0xff15B86C),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  ],
);
