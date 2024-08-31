import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

final shimmerColor = Colors.white.withOpacity(.2);

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    required this.child,
    this.height,
  });

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.withOpacity(.355),
      child: SizedBox(
        height: height,
        child: child,
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
  });

  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: shimmerColor,
        borderRadius: borderRadius ??
            (shape == BoxShape.rectangle ? BorderRadius.circular(3.r) : null),
        shape: shape,
      ),
    );
  }
}

class TextContentShimmerContainer extends StatelessWidget {
  const TextContentShimmerContainer({
    super.key,
    this.numberOfLines = 4,
    this.width,
  });

  final int numberOfLines;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          numberOfLines,
          (index) {
            final isLastElement = index == numberOfLines - 1;

            if (isLastElement) {
              return ShimmerContainer(
                height: 20.h,
                width: 100.w,
              );
            }

            return Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: const TextShimmer(),
            );
          },
        ),
      ),
    );
  }
}

class TextShimmer extends StatelessWidget {
  const TextShimmer({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return ShimmerContainer(
      height: 20.h,
      width: width,
    );
  }
}
