import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/Core/theme/theme_controller.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({
    super.key,
    required this.path,
    this.withColorFilter = true,
    this.width,
    this.height,
  });

  const CustomSvgPicture.withoutColorFilter({required this.path, this.width, this.height})
    : withColorFilter = false;

  final String path;
  final bool withColorFilter;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: withColorFilter
          ? ColorFilter.mode(
              ThemeController.isDark() ? Color(0xffC6C6C6) : Color(0xff6A6A6A),
              BlendMode.srcIn,
            )
          : null,
      width: width,
      height: height,
    );
  }
}
