import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/home_view_app_bar.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/story_list.dart';
import '../widget/home_view_widget/post_type_widget/post_with_grid_img.dart';
import '../widget/home_view_widget/post_type_widget/post_with_slider_img.dart';
import '../widget/home_view_widget/post_type_widget/post_without_img.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppHeight.h5point2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.w6),
          child: HomeViewAppBar(
            onNotificationTaped: () {},
          ),
        ),
        SizedBox(
          height: AppHeight.h2,
        ),
        StoryList(),
        SizedBox(
          height: AppHeight.h2,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidth.w3Point5),
            child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: AppHeight.h2),
                itemBuilder: (context, index) {
                  return PostWithSliderImage();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: AppHeight.h1point5,
                  );
                },
                itemCount: 5),
          ),
        )
      ],
    );
  }
}
