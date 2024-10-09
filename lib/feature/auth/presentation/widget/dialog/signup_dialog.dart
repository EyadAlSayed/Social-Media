import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/helper/validation_helper.dart';
import 'package:social_media/core/injection/injection_container.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';
import 'package:social_media/feature/auth/presentation/cubit/fire_auth_sign_up_cubit/fire_auth_sign_up_cubit.dart';
import '../../../../../core/resource/app_color.dart';
import '../../../../../core/resource/app_enum.dart';
import '../../../../../core/resource/app_size.dart';
import '../../../../../core/widget/button/app_button.dart';
import '../../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../domain/entities/request/signup_request_entity.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
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
    insetPadding: EdgeInsets.symmetric(horizontal: AppWidth.w3point8),
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppWidth.w3point8, vertical: AppHeight.h2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppHeight.h2,
            ),
            AppTextWidget(
              text: "SignUp",
              fontSize: AppFontSize.fs17,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: AppHeight.h2,
            ),
            AppTextFormField(
              controller: controllers.first,
              formKey: formKeys.first,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if ((value ?? "").isEmpty) {
                  return "Empty field";
                }
                if ((value ?? "").isEmailValid() == false) {
                  return "Enter valid email please";
                }
                return null;
              },
              hintText: "Email address",
            ),
            SizedBox(
              height: AppHeight.h2,
            ),
            AppTextFormField(
              passwordMode: true,
              controller: controllers.last,
              formKey: formKeys.last,
              hintText: "Password",
              maxLines: 1,
              validator: (value) {
                if ((value ?? "").isEmpty) {
                  return "Empty field";
                }
                return null;
              },
            ),
            SizedBox(
              height: AppHeight.h2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<FireAuthSignUpCubit, FireAuthSignUpState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.error) {
                      Navigator.of(context).pop();
                      NoteMessage.showErrorSnackBar(
                          context: context, text: state.error ?? "");
                    }
                    if (state.status == CubitStatus.success) {
                      Navigator.of(context).pop();
                      NoteMessage.showSuccessSnackBar(
                          context: context,
                          text: "Your request sent successfully");
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
                      borderRadius: BorderRadius.circular(AppPixel.p20),
                      alignment: Alignment.center,
                      child: AppTextWidget(
                        text: "SignUp",
                        fontSize: AppFontSize.fs16,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        if (isValidInput() == true) {
                          context.read<FireAuthSignUpCubit>().signUp(
                              entity: SignupRequestEntity(
                                  email: controllers.first.text,
                                  password: controllers.last.text));
                        }
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => getIt<FireAuthSignUpCubit>(),
      child: dialog,
    ),
  );
}
