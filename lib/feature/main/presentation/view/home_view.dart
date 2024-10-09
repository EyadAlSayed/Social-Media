import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/resource/app_color.dart';
import 'package:social_media/core/resource/app_size.dart';
import 'package:social_media/core/widget/loading/app_circular_progress_widget.dart';
import 'package:social_media/feature/main/presentation/cubit/home_story_cubit/fire_store_home_story_state.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/home_view_app_bar.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/post_type_widget/post_with_grid_img.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/post_type_widget/post_without_img.dart';
import 'package:social_media/feature/main/presentation/widget/home_view_widget/story_list.dart';
import 'package:social_media/router/app_router_screens_name.dart';
import '../../../../core/resource/app_enum.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../domain/entities/response/home_posts_response_entity.dart';
import '../../domain/entities/response/home_story_response_entity.dart';
import '../cubit/home_posts_cubit/fire_store_home_posts_cubit.dart';
import '../cubit/home_posts_cubit/fire_store_home_posts_state.dart';
import '../cubit/home_story_cubit/fire_store_home_story_cubit.dart';
import '../widget/home_view_widget/post_type_widget/post_with_slider_img.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.darkBlue,
      backgroundColor: AppColor.white,
      onRefresh: () async {
        context.read<FireStoreHomePostsCubit>().getHomePosts();
        context.read<FireStoreHomeStoryCubit>().getHomeStory();
      },
      child: Column(
        children: [
          SizedBox(
            height: AppHeight.h5point2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidth.w6),
            child: HomeViewAppBar(
              onNotificationTaped: () {
                Navigator.of(context)
                    .pushNamed(AppRouterScreenNames.notification);
              },
            ),
          ),
          SizedBox(
            height: AppHeight.h2,
          ),
          BlocConsumer<FireStoreHomeStoryCubit, FireStoreHomeStoryState>(
            listener: (context, state) {
              if (state.status == CubitStatus.error) {
                NoteMessage.showErrorSnackBar(
                    context: context, text: state.error);
              }
            },
            builder: (context, state) {
              if (state.status == CubitStatus.loading) {
                return SizedBox();
              }
              List<Stories> stories = state.entity.stories ?? [];
              if (stories.isEmpty) return SizedBox();

              return Column(
                children: [
                  StoryList(
                    stories: stories,
                  ),
                  SizedBox(
                    height: AppHeight.h2,
                  ),
                ],
              );
            },
          ),
          BlocConsumer<FireStoreHomePostsCubit, FireStoreHomePostsState>(
            listener: (context, state) {
              if (state.status == CubitStatus.error) {
                NoteMessage.showErrorSnackBar(
                    context: context, text: state.error);
              }
            },
            builder: (context, state) {
              if (state.status == CubitStatus.loading) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppCircularProgressWidget(
                        color: AppColor.white,
                      )
                    ],
                  ),
                );
              }

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppWidth.w3point5),
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: AppHeight.h2),
                      itemBuilder: (context, index) {
                        Posts? post = state.entity.posts?[index];

                        if ((post?.postImages ?? []).isEmpty) {
                          return PostWithOutImage(
                            itemIndex: index,
                            posts: state.entity.posts ?? [],
                            post: post,
                          );
                        }

                        if ((post?.postImages ?? []).length > 3) {
                          return PostWithSliderImage(
                            itemIndex: index,
                            posts: state.entity.posts ?? [],
                            post: post,
                          );
                        }

                        return PostWithGridImage(
                          itemIndex: index,
                          posts: state.entity.posts ?? [],
                          post: post,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: AppHeight.h1point5,
                        );
                      },
                      itemCount: state.entity.posts?.length ?? 0),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
