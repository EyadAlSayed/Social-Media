import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';
import '../../../../../core/resource/app_color.dart';
import '../../../../../core/resource/app_size.dart';
import '../../../../../core/widget/button/app_button.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 5/27/2024.
 */

void showSignUpDialog({required BuildContext context}) {
  List<TextEditingController> controllers =
      List.generate(2, (index) => TextEditingController());
  List<GlobalKey<FormState>> formKeys =
      List.generate(2, (index) => GlobalKey<FormState>());

  bool isValidInput() {
    bool isOk = true;
    for (GlobalKey<FormState> element in formKeys) {
      isOk &= element.currentState?.validate() ?? false;
    }
    return isOk;
  }

  Dialog dialog = Dialog(
    backgroundColor: AppColor.white,
    surfaceTintColor: AppColor.white,
    insetPadding: EdgeInsets.symmetric(horizontal: AppWidth.w3Point8),
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppWidth.w3Point8, vertical: AppHeight.h2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField(
              controller: controllers[0],
              formKey: formKeys[0],
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if ((value ?? "").isEmpty) {
                  return "emptyField".tr();
                }
                return null;
              },
              hintText: "Email",
            ),
            SizedBox(
              height: AppHeight.h2,
            ),
            AppTextFormField(
              controller: controllers[1],
              formKey: formKeys[1],
              hintText: "Password",
              validator: (value) {
                if ((value ?? "").isEmpty) {
                  return "emptyField".tr();
                }
                return null;
              },
            ),
            SizedBox(
              height: AppHeight.h2,
            ),
            AppButton(
              color: AppColor.darkBlue,
              borderRadius: BorderRadius.circular(AppRadius.r20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextWidget(
                    text: "SignUp",
                    fontSize: AppFontSize.fs15,
                    color: AppColor.white,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => dialog,
  );
}
