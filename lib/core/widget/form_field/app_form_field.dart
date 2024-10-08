import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_font.dart';

import '../../resource/app_color.dart';
import '../../resource/app_size.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
class AppTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? enabled;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFilledSubmited;
  final Function()? editingComplete;
  final String? Function(String?)? onChanged;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final FocusNode? focusNode;
  final String? labelText;
  final String? initialValue;
  final TextAlignVertical? textAlignVertical;
  final Color? textColor;
  final Color? labelColor;
  final int? maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final TextStyle? hintStyle, style;
  final String? hintText;
  final bool? outlinedBorder;
  final bool? expand;
  final bool? autoFoucs;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool? filled;
  final bool? readOnly;
  final GlobalKey<FormState>? formKey;

  const AppTextFormField(
      {Key? key,
      this.borderRadius,
      this.minLines,
      this.filled,
      this.style,
      this.readOnly,
      this.enabled,
      this.suffixIcon,
      this.fillColor,
      this.expand,
      this.contentPadding,
      this.controller,
      this.formKey,
      this.obscureText,
      this.autoFoucs,
      this.validator,
      this.hintStyle,
      this.editingComplete,
      this.onChanged,
      this.textInputType,
      this.textInputAction,
      this.textAlignVertical,
      this.focusNode,
      this.labelText,
      this.textColor,
      this.labelColor,
      this.onFilledSubmited,
      this.initialValue,
      this.maxLines,
      this.prefixIcon,
      this.hintText,
      this.outlinedBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        key: Key(initialValue ?? ""),
        readOnly: readOnly ?? false,
        textAlignVertical: textAlignVertical,
        onFieldSubmitted: onFilledSubmited,
        validator: validator,
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        autofocus: autoFoucs ?? false,
        onEditingComplete: editingComplete,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        minLines: minLines,
        maxLines: maxLines,
        initialValue: initialValue,
        enabled: enabled,
        expands: expand ?? false,
        decoration: InputDecoration(
          filled: filled ?? true,
          fillColor: fillColor ?? AppColor.white,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: hintStyle,
          prefixIconColor: Colors.grey,
          suffixIconColor: Colors.grey,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                  horizontal: AppWidth.w3,
                  vertical: AppHeight.h1),
          labelText: labelText,
          labelStyle: TextStyle(
              color: labelColor,
              fontSize: AppFontSize.fs16,
              fontWeight: FontWeight.bold,
              fontFamily: AppFontFamily.glory),
          errorStyle: TextStyle(
            fontSize: AppFontSize.fs14,
            fontFamily: AppFontFamily.glory,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  borderRadius != null ? borderRadius! : AppRadius.r10)),
              borderSide: BorderSide(
                color: AppColor.grey.withOpacity(0.6),
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  borderRadius != null ? borderRadius! : AppRadius.r10)),
              borderSide: const BorderSide(
                color: Colors.transparent,
                // color: Colors.transparent,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  borderRadius != null ? borderRadius! : AppRadius.r10)),
              borderSide: BorderSide(
                color: AppColor.grey.withOpacity(0.6),
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  borderRadius != null ? borderRadius! : AppRadius.r10)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              )),
        ),
        style: style ??
            TextStyle(
                color: textColor,
                fontSize: AppFontSize.fs16,
                fontFamily: AppFontFamily.glory),
      ),
    );
  }
}
