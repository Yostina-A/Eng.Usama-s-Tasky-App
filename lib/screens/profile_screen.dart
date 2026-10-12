import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/Core/Widgets/custom_svg_picture.dart';
import 'package:tasky/Core/services/prefences_manager.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';
import 'package:tasky/Core/theme/theme_controller.dart';
import 'package:tasky/main.dart';
import 'package:tasky/screens/welcome_screen.dart';
import 'package:tasky/screens/user_details_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String username;
  late String motivationQuote;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    setState(() {
      isLoading = true;
      username = PrefrencesManager().getString("username") ?? "User Name";
      motivationQuote =
          PrefrencesManager().getString("motivationQuote") ??
          "One task at a time. Real progress.";

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(title: Text("My Profile")),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  // column of the center avatar block
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                "assets/images/avatar_2.webp",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 46,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                ),
                                child: CustomSvgPicture(
                                  path: "assets/images/camera_icon.svg",
                                ),
                              ),
                            ),
                            // second container with Positioned widget (used inside Stack widget only!)
                            //Positioned(
                            // left: 0,
                            // child: GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     width: 46,
                            //     height: 46,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(100),
                            //       color: Color(0xFF282828),
                            //     ),
                            //     child: SvgPicture.asset(
                            //       "assets/images/camera_icon.svg",
                            //       // width: 18,
                            //       // height: 18,
                            //     ),
                            //   ),
                            // ),
                            //),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          username,
                          style: Theme.of(
                            context,
                          ).extension<TextStyles>()!.screenTitle,
                        ),
                        Text(
                          motivationQuote,
                          style: Theme.of(
                            context,
                          ).extension<TextStyles>()!.secondaryText2,
                        ),
                      ],
                    ), // column of the center avatar block
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Profile Info",
                    style: Theme.of(context).extension<TextStyles>()!.bodyOne,
                  ),
                  // first row
                  ListTile(
                    // onTap makes the entire row clickable
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return UserDetailsScreen(
                              userName: username,
                              motivationQuote: motivationQuote,
                            );
                          },
                        ),
                      );
                      if (result != null && result) {
                        _loadData();
                      }
                    },

                    title: Text("User Details"),
                    leading: CustomSvgPicture(
                      path: "assets/images/profile_icon.svg",
                    ),
                    trailing: CustomSvgPicture(
                      path: "assets/images/arrow-right.svg",
                    ),
                  ),
                  Divider(),
                  // second row
                  ListTile(
                    title: Text("Dark Mode"),
                    leading: CustomSvgPicture(
                      path: "assets/images/dark_mode_icon.svg",
                    ),
                    trailing: ValueListenableBuilder(
                      valueListenable: ThemeController.themeNotifier,
                      builder: (context, ThemeMode value, Widget? child) {
                        return Switch(
                          onChanged: (bool value) async {
                            ThemeController.toggleTheme();
                          },
                          value: value == ThemeMode.dark,
                        );
                      },
                    ),
                  ),
                  Divider(),
                  // third row
                  ListTile(
                    // makes the entire row clickable
                    onTap: () async {
                      PrefrencesManager().remove("tasks");
                      PrefrencesManager().remove("username");
                      PrefrencesManager().remove("motivationQuote");

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => WelcomeScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },

                    title: Text("Log Out"),
                    leading: CustomSvgPicture(
                      path: "assets/images/logout_icon.svg",
                    ),
                    trailing: CustomSvgPicture(
                      path: "assets/images/arrow-right.svg",
                    ),
                  ),
                  Divider(),
                ],
              ), //column 1
            ),
          );
  }
}
