import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class ShimmerComponent extends StatelessWidget {
  const ShimmerComponent({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MainColors.shadowColor(context)!.withOpacity(0.5),
      highlightColor: MainColors.shadowColor(context)!,
      child: child,
    );
  }
}
