import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/start_screen.dart';
import 'screens/home_screen.dart';

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
      theme: ThemeData(),
      home: username == null ? StartScreen() : HomeScreen(),
    );
  }
}
