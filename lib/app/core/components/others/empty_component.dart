import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:loogisti/app/core/constants/animations_assets_constants.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class EmptyComponent extends StatelessWidget {
  const EmptyComponent({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AnimationsAssetsConstants.emptyAnimation, width: 300.r),
        if (text != null)
          Center(
            child: Text(
              text ?? '',
              style: TextStyles.largeBodyTextStyle(context),
            ),
          ),
      ],
    );
  }
}
