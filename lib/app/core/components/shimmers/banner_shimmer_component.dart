import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/others/shimmer_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class BannerShimmerComponent extends StatelessWidget {
  const BannerShimmerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: ShimmerComponent(
        child: Container(
          color: MainColors.backgroundColor(context),
        ),
      ),
    );
  }
}
