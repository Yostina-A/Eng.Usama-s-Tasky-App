import 'package:flutter/material.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(primaryContainer: Color(0xffFFFFFF)),
  scaffoldBackgroundColor: Color(0xFFF6F7F9),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF6F7F9),
    titleTextStyle: TextStyle(color: Color(0xFF161F1B), fontSize: 20),
    iconTheme: IconThemeData(color: Color(0xFF161F1B)),
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
      foregroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
      backgroundColor: WidgetStateProperty.all(Color(0xFF15B86C)),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),

    titleSmall: TextStyle(
      color: Color(0xff3A4640),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: Color(0xff3A4640),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: Color(0xff3A4640),
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Color(0xff15B86C),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: Color(0xff15B86C),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: Color(0xff6A6A6A),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: Color(0xff6A6A6A),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color(0xFF9E9E9E),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    filled: true,
    fillColor: Color(0xFFFFFFFF),
    focusColor: Color(0xffD1DAD6),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xffD1DAD6), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xffD1DAD6), width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 252, 173, 120),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color(0xffD1DAD6), width: 1),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: Color(0xffD1DAD6), width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),
  extensions: [
    TextStyles(
      titleOne: TextStyle(
        color: Color(0xff161F1B),
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      titleTwo: TextStyle(
        color: Color(0xff161F1B),
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      titleThree: TextStyle(
        color: Color(0xff161F1B),
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      screenTitle: TextStyle(
        color: Color(0xff161F1B),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyOne: TextStyle(
        color: Color(0xff161F1B),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyTwo: TextStyle(
        color: Color(0xff161F1B),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      textFieldHint: TextStyle(
        color: Color(0xff9E9E9E),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      secondaryText1: TextStyle(
        color: Color(0xff3A4640),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      secondaryText2: TextStyle(
        color: Color(0xff3A4640),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      secondaryText3: TextStyle(
        color: Color(0xff3A4640),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      undoneTask: TextStyle(
        color: Color(0xff161F1B),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      doneTask: TextStyle(
        color: Color(0xff6A6A6A),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.lineThrough,
        decorationColor: Color(0xff49454F),
        overflow: TextOverflow.ellipsis,
      ),
      primaryButtonText: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 14,
        fontWeight: FontWeight.w500,
    ),
    highPriorityTasksTitle: TextStyle(
        color: Color(0xff15B86C),
        fontSize: 14,
        fontWeight: FontWeight.w400,
    ),
    
  )
  ],
);
