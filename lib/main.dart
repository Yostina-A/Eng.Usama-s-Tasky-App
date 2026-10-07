import 'package:flutter/material.dart';
import 'package:tasky/Core/services/prefences_manager.dart';
import 'package:tasky/Core/theme/dark_theme.dart';
import 'package:tasky/Core/theme/light_theme.dart';
import 'package:tasky/screens/main_screen.dart';
import 'screens/start_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // new way of getting an instance of the shared prefrences using prefrenced manager class
  // and it's a one instance across all the app

  await PrefrencesManager().init();

  String? username = PrefrencesManager().getString("username");

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
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: username == null ? StartScreen() : MainScreen(),
    );
  }
}
