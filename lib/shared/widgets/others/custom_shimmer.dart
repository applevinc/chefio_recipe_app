import 'package:flutter/material.dart';
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
  });

  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: shimmerColor,
        borderRadius: borderRadius,
      ),
    );
  }
}
