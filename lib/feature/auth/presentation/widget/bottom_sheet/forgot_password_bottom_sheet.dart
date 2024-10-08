import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/helper/validation_helper.dart';
import 'package:social_media/core/resource/app_enum.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/button/app_button.dart';
import 'package:social_media/core/widget/form_field/app_form_field.dart';
import 'package:social_media/core/widget/loading/app_circular_progress_widget.dart';
import 'package:social_media/core/widget/snack_bar/note_message.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import 'package:social_media/feature/auth/domain/entities/request/forget_password_request_entity.dart';
import 'package:social_media/feature/auth/presentation/cubit/fire_auth_forget_password_cubit/fire_auth_forget_password_cubit.dart';
import 'package:social_media/feature/auth/presentation/cubit/fire_auth_forget_password_cubit/fire_auth_forget_password_state.dart';
import '../../../../../core/injection/injection_container.dart';
import '../../../../../core/resource/app_color.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

void showForgetPasswordBottomSheet({required BuildContext context}) {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Dialog dialog = Dialog(
    backgroundColor: AppColor.white,
    surfaceTintColor: AppColor.white,
    insetPadding: EdgeInsets.symmetric(horizontal: AppWidth.w3point8),
    child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppWidth.w3point8, vertical: AppHeight.h2),
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
                hintText: "Email address"),
            SizedBox(
              height: AppHeight.h3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<FireAuthForgetPasswordCubit,
                    FireAuthForgetPasswordState>(
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
                        text: "Submit",
                        fontSize: AppFontSize.fs16,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          context
                              .read<FireAuthForgetPasswordCubit>()
                              .forgetPassword(
                                  entity: ForgetPasswordRequestEntity(
                                      email: controller.text));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  showDialog(
      context: context,
      builder: (context) => BlocProvider(
          create: (context) => getIt<FireAuthForgetPasswordCubit>(),
          child: dialog));
}
