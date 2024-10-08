import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';
import 'package:social_media/core/widget/loading/app_circular_progress_widget.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';

import '../../../../core/resource/app_color.dart';
import '../../../../core/resource/app_enum.dart';
import '../../../../core/resource/app_image.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/8/2024.
 */

class LoginByFireAuthScreen extends StatefulWidget {
  const LoginByFireAuthScreen({super.key});

  @override
  State<LoginByFireAuthScreen> createState() => _LoginByFireAuthScreenState();
}

class _LoginByFireAuthScreenState extends State<LoginByFireAuthScreen> {
  late List<TextEditingController> controllers;
  late List<GlobalKey<FormState>> keys;

  @override
  void initState() {
    controllers = List.generate(2, (index) => TextEditingController());
    keys = List.generate(2, (index) => GlobalKey<FormState>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppHeight.h10,
            ),
            // Center(
            //   child: Image.asset(
            //     AppImage.login,
            //     width: AppWidth.w52,
            //     height: AppWidth.w52,
            //   ),
            // ),
            SizedBox(
              height: AppHeight.h2,
            ),
            AppTextWidget(
              text: "Login to continue",
              fontSize: AppFontSize.fs17,
              fontWeight: FontWeight.w600,
              color: AppColor.darkBlue,
            ),
            SizedBox(
              height: AppHeight.h8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w5),
              child: AppTextFormField(
                controller: controllers.first,
                formKey: keys.first,
                validator: (value) {
                  if ((value ?? "").isEmpty) {
                    return "error";
                  }
                  return null;
                },
                textInputType: TextInputType.emailAddress,
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: AppHeight.h2point5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w5),
              child: AppTextFormField(
                obscureText: true,

                controller: controllers.last,
                formKey: keys.last,
                validator: (value) {
                  if ((value ?? "").isEmpty) {
                    return "error";
                  }
                  return null;
                },
                textInputType: TextInputType.text,
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: AppHeight.h6,
            ),
            AppButton(
              width: AppWidth.w80,
              height: AppHeight.h6,
              color: AppColor.darkBlue,
              borderRadius: BorderRadius.circular(6),
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w5),
              child: AppTextWidget(
                text: "Login",
                color: AppColor.white,
                fontSize: AppFontSize.fs17,
                fontWeight: FontWeight.w600,
              ),
              onTap: () {},
            ),
            SizedBox(
              height: AppHeight.h6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextWidget(
                  text: "You dont have account",
                  color: AppColor.darkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.fs16,
                ),
                SizedBox(
                  width: AppWidth.w1,
                ),
                InkWell(
                  onTap: () {},
                  child: AppTextWidget(
                    text: "Register",
                    color: AppColor.darkBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fs16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppHeight.h8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextWidget(
                  text: "Did you forget password",
                  color: AppColor.darkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.fs16,
                ),
                SizedBox(
                  width: AppWidth.w1,
                ),
                InkWell(
                  onTap: () {},
                  child: AppTextWidget(
                    text: "Reset",
                    color: AppColor.darkBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: AppFontSize.fs16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var it in controllers) {
      it.dispose();
    }
    super.dispose();
  }

  bool isValidInput() {
    bool isOk = true;
    for (var it in keys) {
      isOk &= it.currentState?.validate() ?? false;
    }
    return isOk;
  }
}
