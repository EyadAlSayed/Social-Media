import 'package:flutter/material.dart';

import '../../../../core/helper/app_info_helper.dart';
import '../../../../core/resource/app_color.dart';
import '../../../../core/resource/app_font.dart';
import '../../../../core/resource/app_icon.dart';
import '../../../../core/resource/app_size.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../widget/profile/more_gride_title_list.dart';
import '../widget/profile/settings_item.dart';
import '../widget/profile/user_profile_info.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w3Point8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppHeight.h5point2,
          ),
          UserProfileInfo(
            onEditClicked: () {},
          ),
          SizedBox(
            height: AppHeight.h4,
          ),
          MoreGridTitleList(
            title: "Settings",
            itemWidgets: [
              SettingsItem(
                onTap: () {},
                title: "Language",
                icon: AppIcon.translate,
              ),
              SettingsItem(
                onTap: () {},
                title: "About Us",
                icon: AppIcon.aboutUs,
              ),
              SettingsItem(
                onTap: () {},
                title: "Contact Us",
                icon: AppIcon.call,
              ),
              SettingsItem(
                onTap: () {},
                title: "Privacy Policy",
                icon: AppIcon.privacyPolicy,
                fontSize: AppFontSize.fs14,
              ),
              SettingsItem(
                onTap: () {},
                title: "Sign out",
                icon: AppIcon.logout,
              ),
              SettingsItem(
                onTap: () {},
                title: "Delete account",
                icon: AppIcon.trash,
                isDeleteItem: true,
              ),
            ],
            separatorWidget: SizedBox(
              height: AppHeight.h1,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: AppHeight.h4),
            alignment: Alignment.center,
            child: AppTextWidget(
              text: "Social Media  v${AppInfoHelper.getAppVersion()}",
              fontSize: AppFontSize.fs15,
              color: AppColor.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
