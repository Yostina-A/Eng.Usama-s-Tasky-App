import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final String username;
  bool isLoading = true;
  bool isDarkMode = true;

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  void _getUserName() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      username = pref.getString("username") ?? "User Name";
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
                                  color: Color(0xFF282828),
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "One task at a time. One step closer.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ), // column of the center avatar block
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Profile Info",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // first row
                  ListTile(
                    onTap: () {}, // makes the entire row clickable
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "User Profile",
                      style: TextStyle(color: Colors.white),
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
                      style: TextStyle(color: Colors.white),
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
                      value: isDarkMode),
                  ),
                  Divider(
                    color: Color(0xFFCAC4D0),
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  // third row
                  ListTile(
                    onTap: () {}, // makes the entire row clickable
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
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
