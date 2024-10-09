import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_font.dart';

import '../../resource/app_color.dart';
import '../../resource/app_size.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
class AppTextFormField extends StatefulWidget {
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool? enabled;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
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
  final bool? autoFocus;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool? filled;
  final bool? readOnly;
  final bool? passwordMode;
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
      this.autoFocus,
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
      this.onFieldSubmitted,
      this.initialValue,
      this.maxLines,
      this.prefixIcon,
      this.hintText,
      this.passwordMode,
      this.outlinedBorder})
      : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        key: Key(widget.initialValue ?? ""),
        readOnly: widget.readOnly ?? false,
        textAlignVertical: widget.textAlignVertical,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: widget.passwordMode == true ? _obscureText : false,
        onChanged: widget.onChanged,
        autofocus: widget.autoFocus ?? false,
        onEditingComplete: widget.editingComplete,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        expands: widget.expand ?? false,
        decoration: InputDecoration(
          filled: widget.filled ?? true,
          fillColor: widget.fillColor ?? AppColor.white,
          hintText: widget.hintText,
          suffixIcon: widget.passwordMode == true
              ? IconButton(
                  icon: Icon(
                    color: AppColor.darkBlue,
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          hintStyle: widget.hintStyle,
          prefixIconColor: Colors.grey,
          suffixIconColor: Colors.grey,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(
                  horizontal: AppWidth.w3, vertical: AppHeight.h1),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: widget.labelColor,
              fontSize: AppFontSize.fs16,
              fontWeight: FontWeight.bold,
              fontFamily: AppFontFamily.glory),
          errorStyle: TextStyle(
            fontSize: AppFontSize.fs14,
            fontFamily: AppFontFamily.glory,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  widget.borderRadius != null
                      ? widget.borderRadius!
                      : AppPixel.p10)),
              borderSide: BorderSide(
                color: AppColor.grey.withOpacity(0.6),
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  widget.borderRadius != null
                      ? widget.borderRadius!
                      : AppPixel.p10)),
              borderSide: const BorderSide(
                color: Colors.transparent,
                // color: Colors.transparent,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  widget.borderRadius != null
                      ? widget.borderRadius!
                      : AppPixel.p10)),
              borderSide: BorderSide(
                color: AppColor.grey.withOpacity(0.6),
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  widget.borderRadius != null
                      ? widget.borderRadius!
                      : AppPixel.p10)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              )),
        ),
        style: widget.style ??
            TextStyle(
                color: widget.textColor,
                fontSize: AppFontSize.fs16,
                fontFamily: AppFontFamily.glory),
      ),
    );
  }
}
