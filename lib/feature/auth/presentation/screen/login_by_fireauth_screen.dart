import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media/core/helper/validation_helper.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_icon.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';
import 'package:social_media/core/widget/loading/app_circular_progress_widget.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import 'package:social_media/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:social_media/feature/auth/presentation/cubit/fire_auth_login_cubit/fire_auth_login_cubit.dart';
import 'package:social_media/feature/auth/presentation/widget/bottom_sheet/forgot_password_bottom_sheet.dart';
import 'package:social_media/feature/auth/presentation/widget/dialog/signup_dialog.dart';
import 'package:social_media/router/app_router_screens_name.dart';
import '../../../../core/resource/app_color.dart';
import '../../../../core/resource/app_enum.dart';
import '../../../../core/widget/snack_bar/note_message.dart';

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
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppHeight.h20,
            ),
            Center(
              child: SvgPicture.asset(
                width: AppWidth.w20,
                height: AppWidth.w20,
                AppIcon.firebase,
                colorFilter: ColorFilter.mode(
                  AppColor.darkBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
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
                    return "Empty field";
                  }
                  if ((value ?? "").isEmailValid() == false) {
                    return "Enter valid email please";
                  }
                  return null;
                },
                textInputType: TextInputType.emailAddress,
                hintText: "Email address",
              ),
            ),
            SizedBox(
              height: AppHeight.h2point5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w5),
              child: AppTextFormField(
                passwordMode: true,
                controller: controllers.last,
                formKey: keys.last,
                validator: (value) {
                  if ((value ?? "").isEmpty) {
                    return "Empty field";
                  }
                  return null;
                },
                maxLines: 1,
                textInputType: TextInputType.text,
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: AppHeight.h6,
            ),
            BlocConsumer<FireAuthLoginCubit, FireAuthLoginState>(
              listener: (context, state) {
                if (state.status == CubitStatus.error) {
                  NoteMessage.showErrorSnackBar(
                      context: context, text: state.error ?? "");
                }
                if (state.status == CubitStatus.success) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouterScreenNames.main,
                    (route) => false,
                  );
                }
              },
              builder: (context, state) {
                if (state.status == CubitStatus.loading) {
                  return AppCircularProgressWidget();
                }
                return AppButton(
                  width: AppWidth.w80,
                  height: AppHeight.h6,
                  color: AppColor.darkBlue,
                  alignment: Alignment.center,
                  borderRadius: BorderRadius.circular(AppPixel.p20),
                  padding: EdgeInsets.symmetric(horizontal: AppWidth.w5),
                  child: AppTextWidget(
                    text: "Login",
                    color: AppColor.white,
                    fontSize: AppFontSize.fs17,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    if (isValidInput() == true) {
                      context.read<FireAuthLoginCubit>().login(
                          entity: LoginRequestEntity(
                              email: controllers.first.text,
                              password: controllers.last.text));
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: AppHeight.h6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextWidget(
                  text: "You don't have account ?",
                  color: AppColor.darkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.fs16,
                ),
                SizedBox(
                  width: AppWidth.w1,
                ),
                InkWell(
                  onTap: () {
                    showSignUpDialog(context: context);
                  },
                  child: AppTextWidget(
                    text: "Register",
                    color: AppColor.blue,
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
                  text: "Did you forget password ?",
                  color: AppColor.darkBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.fs16,
                ),
                SizedBox(
                  width: AppWidth.w1,
                ),
                InkWell(
                  onTap: () {
                    showForgetPasswordBottomSheet(context: context);
                  },
                  child: AppTextWidget(
                    text: "Reset",
                    color: AppColor.blue,
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
