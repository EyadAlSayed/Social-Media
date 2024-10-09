import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media/core/resource/app_font.dart';
import 'package:social_media/core/widget/text/app_text_widget.dart';
import '../../../../../../core/resource/app_color.dart';
import '../../../../../../core/resource/app_size.dart';
import '../../../../domain/entities/response/home_posts_response_entity.dart';
import '../post_item_details_widget/post_button.dart';
import '../post_item_details_widget/post_header.dart';
import '../post_item_details_widget/post_slide_img.dart';
import '../post_item_details_widget/post_tagged_text.dart';
import '../post_item_details_widget/post_widget.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class PostWithSliderImage extends StatefulWidget {
  const PostWithSliderImage(
      {super.key,
      required this.itemIndex,
      required this.post,
      required this.posts});

  final Posts? post;
  final List<Posts> posts;
  final int itemIndex;

  @override
  State<PostWithSliderImage> createState() => _PostWithSliderImageState();
}

class _PostWithSliderImageState extends State<PostWithSliderImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w3point5, vertical: AppHeight.h1point5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPixel.p20),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
                color: AppColor.grey.withOpacity(0.15),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(2, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(
            userImage: widget.post?.userImage ?? "",
            taggedUser: widget.post?.taggedUser ?? "",
            userName: widget.post?.userName ?? "",
            createdAt: widget.post?.createdAt ?? "",
          ),
          SizedBox(
            height: AppHeight.h1point5,
          ),
          PostSlidImage(images: widget.post?.postImages ?? []),
          SizedBox(
            height: AppHeight.h1point5,
          ),
          PostTaggedText(text: widget.post?.postText ?? ""),
          SizedBox(
            height: AppHeight.h1point5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: AppHeight.h4,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PostTag(
                        tag: widget.post?.postTags?[index] ?? "",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: AppWidth.w2,
                      );
                    },
                    itemCount: (widget.post?.postTags?.length ?? 0) > 3
                        ? 3
                        : (widget.post?.postTags?.length ?? 0)),
              ),
              Visibility(
                visible: (widget.post?.postTags?.length ?? 0) > 3,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: AppWidth.w10,
                      height: AppWidth.w10,
                      margin: EdgeInsets.only(right: AppWidth.w4),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.offWhite,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.grey.withOpacity(0.6),
                                offset: const Offset(0, 1),
                                spreadRadius: 0,
                                blurRadius: 6,
                                blurStyle: BlurStyle.normal)
                          ]),
                    ),
                    Container(
                      width: AppWidth.w10,
                      height: AppWidth.w10,
                      margin: EdgeInsets.only(right: AppWidth.w2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.offWhite,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.grey.withOpacity(0.4),
                                offset: const Offset(0, 1),
                                spreadRadius: 0,
                                blurRadius: 6,
                                blurStyle: BlurStyle.normal)
                          ]),
                    ),
                    Container(
                      width: AppWidth.w10,
                      height: AppWidth.w10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.offWhite,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.grey.withOpacity(0.6),
                                offset: const Offset(0, 1),
                                spreadRadius: 0,
                                blurRadius: 6,
                                blurStyle: BlurStyle.normal)
                          ]),
                      child: AppTextWidget(
                        text: "+3",
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.fs18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: AppHeight.h2,
          ),
          PostButton(
            isLike: widget.post?.isLike??false,

            comments: widget.post?.comments ?? [],
            itemIndex: widget.itemIndex,
            posts: widget.posts,
            totalLikes: widget.post?.totalLikes,
            totalComments: widget.post?.totalComments,
          )
        ],
      ),
    );
  }
}
