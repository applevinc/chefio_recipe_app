import 'package:cached_network_image/cached_network_image.dart';
import 'package:chefio_recipe_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage({
    Key? key,
    required this.image,
    this.size,
    this.height,
    this.width,
    this.borderRadius,
    this.shape,
    this.fit,
  }) : super(key: key);

  final String image;
  final double? size;
  final double? height;
  final double? width;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
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
      progressIndicatorBuilder: (context, url, progress) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
          color: Colors.grey.withOpacity(.8),
        ),
        child: Transform.scale(
          scale: 1.0,
          child: const CircularProgressIndicator.adaptive(),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
        ),
        child: const Icon(Icons.error_outline),
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
