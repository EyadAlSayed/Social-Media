import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resource/app_color.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon(
      {super.key,
      required this.selectedIndex,
      required this.itemIndex,
      required this.icon});

  final String icon;
  final int itemIndex, selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
          itemIndex == selectedIndex
              ? AppColor.darkBlue
              : AppColor.grey,
          BlendMode.srcIn),
    );
  }
}
