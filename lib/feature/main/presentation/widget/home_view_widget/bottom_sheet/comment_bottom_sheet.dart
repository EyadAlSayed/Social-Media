import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';

import '../../../../../../core/resource/app_color.dart';

/**
 * Created by Eng.Eyad AlSayed on 5/14/2024.
 */

void showCommentBottomSheet({required BuildContext context}) {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
              left: AppWidth.w5,
              right: AppWidth.w5,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: AppHeight.h2,
              ),
              AppTextWidget(
                text: "Forget password",
                fontSize: AppFontSize.fs16,
              ),
              SizedBox(
                height: AppHeight.h2,
              ),
              AppTextFormField(
                  controller: controller,
                  formKey: formKey,
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "emptyField".tr();
                    }
                    return null;
                  },
                  hintText: "username or email address"),
              SizedBox(
                height: AppHeight.h3,
              ),
              AppButton(
                color: AppColor.darkBlue,
                borderRadius: BorderRadius.circular(AppRadius.r20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextWidget(
                      text: "Submit",
                      fontSize: AppFontSize.fs15,
                      color: AppColor.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppHeight.h2,
              ),
            ],
          ),
        );
      });
}
