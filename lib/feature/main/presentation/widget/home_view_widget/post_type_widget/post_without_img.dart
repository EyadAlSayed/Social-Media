import 'package:flutter/material.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_size.dart';
import '../../../../domain/entities/response/home_posts_response_entity.dart';
import '../post_item_details_widget/post_button.dart';
import '../post_item_details_widget/post_header.dart';
import '../post_item_details_widget/post_tagged_text.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class PostWithOutImage extends StatelessWidget {
  const PostWithOutImage(
      {super.key,
      required this.post,
      required this.itemIndex,
      required this.posts});

  final Posts? post;
  final List<Posts> posts;
  final int itemIndex;

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
                color: AppColor.grey.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(2, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(
            userName: post?.userName ?? '',
            taggedUser: post?.taggedUser ?? "",
            userImage: post?.userImage ?? "",
            createdAt: post?.createdAt ?? "",
          ),
          SizedBox(
            height: AppHeight.h1point5,
          ),
          PostTaggedText(text: post?.postText ?? ""),
          SizedBox(
            height: AppHeight.h1point5,
          ),
          Divider(
            color: AppColor.darkGrey.withOpacity(0.6),
          ),
          SizedBox(
            height: AppHeight.h1point5,
          ),
          PostButton(
            isLike: post?.isLike ?? false,
            comments: post?.comments ?? [],
            posts: posts,
            itemIndex: itemIndex,
            totalComments: post?.totalComments,
            totalLikes: post?.totalLikes,
          )
        ],
      ),
    );
  }
}
