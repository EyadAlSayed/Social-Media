import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resource/app_color.dart';
import '../../../../../core/resource/app_font.dart';
import '../../../../../core/resource/app_size.dart';
import '../../../../../core/widget/container/decorated_container.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon,
        this.fontSize,
      this.isDeleteItem = false});
  final String title;
  final String icon;
  final Function() onTap;
  final bool isDeleteItem;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const MaterialStatePropertyAll(AppColor.transparent),

      onTap: onTap,
      child: DecoratedContainer(
        borderRadius: BorderRadius.circular(AppRadius.r15),
        padding: EdgeInsets.all(AppWidth.w5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                  isDeleteItem ? AppColor.red : AppColor.black,
                  BlendMode.srcIn),
            ),
            SizedBox(
              width: AppWidth.w2,
            ),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: AppTextWidget(
                      text: title,
                      fontSize:fontSize?? AppFontSize.fs15,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      color: isDeleteItem
                          ? AppColor.red
                          : AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
