import 'package:flutter/material.dart';

import '../../resource/app_color.dart';
import '../../resource/app_font.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
class AppTextWidget extends StatefulWidget {
  final String text;
  final double? height, letterSpacing, fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final Color? decorationColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;



  final bool? softWrap;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  const AppTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.fontStyle,
    this.color = AppColor.black,
    this.decorationColor,
    this.textDecoration,
    this.textAlign,
    this.letterSpacing,
    this.textDirection,
    this.style,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.padding,
    this.onTap,
  });

  @override
  State<AppTextWidget> createState() => _AppTextWidgetState();
}

class _AppTextWidgetState extends State<AppTextWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Text(
          widget.text,
          maxLines: widget.maxLines,
          overflow: widget.overflow ?? TextOverflow.ellipsis,
          softWrap: widget.softWrap,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          style: widget.style ??
              TextStyle(
                  fontFamily: AppFontFamily.glory,
                  fontSize: widget.fontSize ?? AppFontSize.fs14,
                  fontWeight: widget.fontWeight,
                  color: widget.color,
                  decoration: widget.textDecoration,
                  decorationColor: widget.decorationColor,
                  height: widget.height,
                  letterSpacing: widget.letterSpacing
              ),
        ),
      ),
    );
  }
}
