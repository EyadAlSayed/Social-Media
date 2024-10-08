import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../resource/app_image.dart';

/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */
class AppImageWidget extends StatelessWidget {
  const AppImageWidget({
    super.key,
    this.imageUrl = '',
    this.imagePath,
    this.placeholderUrl,
    this.fit,
    this.width,
    this.height,
    this.shape,
    this.borderRadius,
  });

  final String imageUrl;
  final String? imagePath;
  final String? placeholderUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            fit: fit ?? BoxFit.cover,
            errorWidget: (context, url, error) => Image.asset(
              AppImage.placeHolder,
              fit: fit ?? BoxFit.cover,
            ),
            progressIndicatorBuilder: (context, url, progress) {
              return const MainProgressImageWidget();
            },
          )
        : imagePath != null
            ? Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  image: DecorationImage(
                    image: Image.asset(
                      imagePath!,
                      width: width,
                      height: height,
                    ).image,
                    fit: fit ?? BoxFit.cover,
                  ),
                ),
              )
            : const MainProgressImageWidget();
  }
}

class MainProgressImageWidget extends StatelessWidget {
  const MainProgressImageWidget({super.key, this.width, this.height});

  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color(0xffe0e0e0),
        highlightColor: const Color(0xffd9d9d9),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: Colors.grey[400],
          ),
        ));
  }
}
