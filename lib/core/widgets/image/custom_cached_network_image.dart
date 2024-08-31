import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chefio_recipe_app/core/widgets/others/custom_shimmer.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage({
    super.key,
    required this.imageUrl,
    this.size,
    this.height,
    this.width,
    this.borderRadius,
    this.shape,
    this.fit,
  });

  final String? imageUrl;
  final double? size;
  final double? height;
  final double? width;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return errorView();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      width: width,
      height: height,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) => CustomShimmer(
        child: ShimmerContainer(
          width: width,
          height: height,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
        ),
      ),
      errorWidget: (context, url, error) {
        log('IMAGE URL: $url');
        log('IMAGE URL ERROR: $error');
        return errorView();
      },
    );
  }

  Widget errorView() {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
        color: Colors.grey.withOpacity(.5),
      ),
      child: const Icon(
        Icons.error_outlined,
        color: Colors.white,
      ),
    );
  }
}

class DefaultImageView extends StatelessWidget {
  const DefaultImageView({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary),
      ),
      child: Icon(
        Icons.person,
        size: size,
        color: Colors.white,
      ),
    );
  }
}
