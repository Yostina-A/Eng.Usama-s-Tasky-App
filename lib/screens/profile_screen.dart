import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/Core/services/prefences_manager.dart';
import 'package:tasky/Core/theme/text_styles_extention.dart';
import 'package:tasky/screens/start_screen.dart';
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
  bool isDarkMode = true;

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
                                  color:Theme.of(context).colorScheme.primaryContainer,
                                ),
                                child: SvgPicture.asset(
                                  "assets/images/camera_icon.svg",
                                  // width: 18,
                                  // height: 18,
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
                          style: Theme.of(context).extension<TextStyles>()!.screenTitle,
                        ),
                        Text(
                          motivationQuote,
                          style: Theme.of(context).extension<TextStyles>()!.secondaryText2,
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
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "User Details",
                      style: Theme.of(context).extension<TextStyles>()!.bodyOne,
                    ),
                    leading: SvgPicture.asset("assets/images/profile_icon.svg"),
                    trailing: SvgPicture.asset("assets/images/arrow-right.svg"),
                  ),
                  Divider(
                    color: Color(0xFFCAC4D0),
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  // second row
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Dark Mode",
                      style: Theme.of(context).extension<TextStyles>()!.bodyOne,
                    ),
                    leading: SvgPicture.asset(
                      "assets/images/dark_mode_icon.svg",
                    ),
                    trailing: Switch(
                      onChanged: (bool value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                      value: isDarkMode,
                    ),
                  ),
                  Divider(
                    color: Color(0xFFCAC4D0),
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
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
                          builder: (BuildContext context) => StartScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Log Out",
                      style: Theme.of(context).extension<TextStyles>()!.bodyOne,
                    ),
                    leading: SvgPicture.asset("assets/images/logout_icon.svg"),
                    trailing: SvgPicture.asset("assets/images/arrow-right.svg"),
                  ),
                  Divider(
                    color: Color(0xFFCAC4D0),
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ), //column 1
            ),
          );
  }
}
