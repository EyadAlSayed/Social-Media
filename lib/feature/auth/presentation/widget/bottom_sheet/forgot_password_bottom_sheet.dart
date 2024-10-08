import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import '../../../../../core/resource/app_color.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

void showForgetPasswordBottomSheet({required BuildContext context}) {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: AppColor.white,
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
                fontSize: AppFontSize.fs17,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: AppHeight.h2,
              ),
              AppTextFormField(
                  controller: controller,
                  formKey: formKey,
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "Empty field";
                    }
                    return null;
                  },
                  hintText: "Email address"),
              SizedBox(
                height: AppHeight.h3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    width: AppWidth.w80,
                    height: AppHeight.h6,
                    color: AppColor.darkBlue,
                    borderRadius: BorderRadius.circular(AppRadius.r20),
                    alignment: Alignment.center,
                    child: AppTextWidget(
                      text: "Submit",
                      fontSize: AppFontSize.fs16,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppHeight.h2,
              ),
            ],
          ),
        );
      });
}
