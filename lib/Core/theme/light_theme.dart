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
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Color(0xFFFFFFFF),
    extendedTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
  iconTheme: IconThemeData(color: Color(0xff6A6A6A)),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Color(0xff161F1B),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    contentPadding: EdgeInsets.zero,
  ),
  dividerTheme: DividerThemeData(color: Color(0xffD1DAD6), thickness: 1),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Color.fromARGB(255, 171, 250, 170),
    selectionHandleColor: Color(0xFF15B86C),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xffF6F7F9),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color(0xFF14A662),
    unselectedItemColor: Color(0xFF3A4640),
  ),
  splashFactory: NoSplash.splashFactory,

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
      highPriorityTasksTitle: TextStyle(
        color: Color(0xff15B86C),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  ],
);
