import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/Core/Widgets/custom_svg_picture.dart';
import 'package:tasky/Core/Widgets/custom_text_form_field.dart';
import 'package:tasky/Core/services/prefences_manager.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';
import 'package:tasky/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    CustomSvgPicture.withoutColorFilter(path: 
                      "assets/images/logo.svg",
                      width: 42,
                      height: 42,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Tasky",
                      style: Theme.of(context).extension<TextStyles>()!.titleOne,
                    ),
                  ],
                ),

                SizedBox(height: 116),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome To Tasky",
                      style: Theme.of(context).extension<TextStyles>()!.titleTwo,
                    ),

                    SizedBox(width: 8),

                    CustomSvgPicture.withoutColorFilter(path: "assets/images/waving-hand.svg"),
                  ],
                ),

                SizedBox(height: 8),

                Text(
                  "Your productivity journey starts here.",
                  style: Theme.of(context).extension<TextStyles>()!.bodyOne,
                ),

                SizedBox(height: 24),

                CustomSvgPicture.withoutColorFilter(path: "assets/images/start_screen_graphic.svg"),

                SizedBox(height: 28),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 8),
                      CustomTextFormField(
                        label: "Full Name",
                        controller: controller,
                        hintText: "e.g. Sarah Khalid",
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? false) {
                            return "Please enter your full name";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 24),

                      ElevatedButton(
                        onPressed: () async {
                          if (_key.currentState?.validate() ?? false) {
                            await PrefrencesManager().setString(
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
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter your full name"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            40,
                          ),
                        ),
                        child: Text("Let's Get Started"),
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
