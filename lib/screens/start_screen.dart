import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/logo.svg",
                      width: 42,
                      height: 42,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Tasky",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 116),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To Tasky",
                      style: TextStyle(
                        color: Color(0xFFFFFCFC),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(width: 8),

                    SvgPicture.asset("assets/images/waving-hand.svg"),
                  ],
                ),

                SizedBox(height: 8),

                Text(
                  "Your productivity journey starts here.",
                  style: TextStyle(
                    color: Color(0xFFFFFCFC),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 24),

                SvgPicture.asset("assets/images/start_screen_graphic.svg"),

                SizedBox(height: 28),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Full Name",
                          style: TextStyle(
                            color: Color(0xFFFFFCFC),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      SizedBox(height: 8),

                      TextFormField(
                        controller: controller,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your full name";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "e.g. Sarah Khalid",
                          hintStyle: TextStyle(color: Color(0xFF6D6D6D)),
                          filled: true,
                          fillColor: Color(0xFF282828),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        cursorColor: Colors.white,
                      ),

                      SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: () async {
                          if (_key.currentState?.validate() ?? false) {
                            final pref = await SharedPreferences.getInstance();
                            await pref.setString(
                              "username",
                              controller.value.text,
                            );
                            controller.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          } //else snackbar
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF15B86C),
                          foregroundColor: Color(0xFFFFFCFC),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            40,
                          ),
                        ),
                        child: Text(
                          "Let's Get Started",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
