import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/screens/main_screen.dart';
import 'screens/start_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();
  String? username = pref.getString("username");

  runApp(MyApp(username: username));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.username});

  final String? username;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasky',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF181818),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF181818),
          titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
          iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        ),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith((states){
            if(states.contains(WidgetState.selected)) {
              return Color(0xFF15B86C);
            }
            return Colors.white;
          }),
          thumbColor: WidgetStateProperty.resolveWith((states){
            if(states.contains(WidgetState.selected)) {
              return Color(0xFFFFFCFC);
            }
            return Color(0xFF9E9E9E);
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((states){
            if(states.contains(WidgetState.selected)) {
              return Colors.transparent;
            }
            return Color(0xFF9E9E9E);
          }),
          trackOutlineWidth: WidgetStateProperty.resolveWith((states){
            if(states.contains(WidgetState.selected)) {
              return 0;
            }
            return 2;
          }),

        ),
      ),
      home: username == null ? StartScreen() : MainScreen(),
    );
  }
}
