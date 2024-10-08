import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resource/app_font.dart';
import '../../../../../core/resource/app_size.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class MoreGridTitleList extends StatelessWidget {
  const MoreGridTitleList(
      {super.key,
      required this.title,
      required this.separatorWidget,
      required this.itemWidgets});

  final String title;
  final Widget separatorWidget;
  final List<Widget> itemWidgets;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppTextWidget(
        text: title,
        fontWeight: FontWeight.w700,
        fontSize: AppFontSize.fs17,
      ),
      SizedBox(
        height: AppHeight.h1point8,
      ),
      GridView.count(
        childAspectRatio: (MediaQuery.of(context).size.width /
                MediaQuery.of(context).size.height) *
            AppHeight.h06,
        crossAxisCount: 2,
        primary: false,
        crossAxisSpacing: AppWidth.w2,
        mainAxisSpacing: AppHeight.h1point5,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: itemWidgets,
      )
    ]);
  }
}
