import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/post_item_details_widget/post_comment_field.dart';

import '../../../../../../core/resource/app_color.dart';
import '../post_item_details_widget/comment_item.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

void showCommentBottomSheet({required BuildContext context}) {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.white,
      enableDrag: true,
      builder: (BuildContext context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: AppHeight.h30, // Minimum height
            maxHeight: AppHeight.h80, // Maximum height
          ),
          child: Container(
            padding: EdgeInsets.only(
                left: AppWidth.w5,
                right: AppWidth.w5,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: AppWidth.w100,
                  height: AppHeight.h2,
                ),
                AppTextWidget(
                  text: "Comments",
                  fontSize: AppFontSize.fs17,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: AppHeight.h2,
                ),
                Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.only(bottom: AppHeight.h2),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CommentItem();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: AppHeight.h2,
                        );
                      },
                      itemCount: 15),
                ),
                PostCommentField(),
              ],
            ),
          ),
        );
      });
}
