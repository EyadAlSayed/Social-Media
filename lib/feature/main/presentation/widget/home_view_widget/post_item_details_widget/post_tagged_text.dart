import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_font.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class PostTaggedText extends StatelessWidget {
  const PostTaggedText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> spans = [];

    // Split the text based on spaces to find the tags starting with '@'
    text.split(' ').forEach((word) {
      if (word.startsWith('@')) {
        // If the word starts with '@', apply a special style
        spans.add(TextSpan(
          text: '$word ', // Preserve the space after the word
          style: TextStyle(
            color: AppColor.darkGrey, // Color for @tags
            fontFamily: AppFontFamily.glory,
            fontSize: AppFontSize.fs17,
            fontWeight: FontWeight.bold, // Make it bold
          ),
        ));
      } else {
        // Otherwise, use the default style
        spans.add(TextSpan(
          text: '$word ', // Preserve the space after the word
          style: TextStyle(
              color: AppColor.darkGrey,
              fontSize: AppFontSize.fs16,
              fontFamily: AppFontFamily.glory,
              fontWeight: FontWeight.w600),
        ));
      }
    });

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
