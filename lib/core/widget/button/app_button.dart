import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_size.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.haveShadow,
    this.outLinedBorder,
    this.child,
    this.padding,
    this.margin,
    this.alignment,
    this.onTap,
    this.borderRadius,
  });
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final bool? haveShadow;
  final bool? outLinedBorder;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        alignment: alignment,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: outLinedBorder == true
              ? Border.all(
                  color: borderColor!,
                )
              : null,
          boxShadow: haveShadow == true
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.45),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset:
                        // changes position of shadow
                        const Offset(0, 0),
                  ),
                ]
              : null,
          color: outLinedBorder == true ? AppColor.white : color,
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppRadius.r3),
        ),
        child: child,
      ),
    );
  }
}
