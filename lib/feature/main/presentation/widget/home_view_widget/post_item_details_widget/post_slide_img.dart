import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:social_media/core/widget/image/app_image_widget.dart';
import '../../../../../../core/resource/app_color.dart';
import '../../../../../../core/resource/app_size.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class PostSlidImage extends StatefulWidget {
  const PostSlidImage({super.key, required this.images});

  final List<String> images;

  @override
  State<PostSlidImage> createState() => _PostSlidImageState();
}

class _PostSlidImageState extends State<PostSlidImage> {
  int selectedPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: selectedPage, viewportFraction: 0.8, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                selectedPage = index;
              });
            },
            aspectRatio: AppWidth.w84 / AppHeight.h40,
            enableInfiniteScroll: true,
            autoPlay: false,
            viewportFraction: 1,
          ),
          items: widget.images.map((item) {
            return Container(
                width: AppWidth.w92,
                margin: EdgeInsets.symmetric(horizontal: AppWidth.w1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppPixel.p15)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: AppImageWidget(imageUrl: item,));
          }).toList(),
        ),
        SizedBox(
          height: AppHeight.h1point8,
        ),
        Container(
          margin: EdgeInsets.only(bottom: AppHeight.h1point5),
          child: DotsIndicator(
            dotsCount: widget.images.isEmpty ? 1 : widget.images.length,
            position: selectedPage,
            decorator: DotsDecorator(
              spacing: EdgeInsets.only(
                  left: AppWidth.w1point8,
                  right: AppWidth.w1point8),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppPixel.p10,
                ),
              ),
              activeSize: Size(
                AppWidth.w6,
                AppHeight.h08,
              ),
              size: Size(
                AppWidth.w1point5,
                AppWidth.w1point5,
              ),
              activeColor: AppColor.white,
              color: AppColor.white,
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
