import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';

import '../../../../../../core/resource/app_icon.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/8/2024.
 */

class PostCommentField extends StatefulWidget {
  const PostCommentField({super.key});

  @override
  State<PostCommentField> createState() => _PostCommentFieldState();
}

class _PostCommentFieldState extends State<PostCommentField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: AppHeight.h8,
            width: AppWidth.w80,
            child: AppTextFormField()),
        SizedBox(
          width: AppWidth.w1Point5,
        ),
        Container(
          margin: EdgeInsets.only(bottom: AppHeight.h2),
          child: SvgPicture.asset(

            AppIcon.send,
            colorFilter: ColorFilter.mode(AppColor.darkBlue, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
