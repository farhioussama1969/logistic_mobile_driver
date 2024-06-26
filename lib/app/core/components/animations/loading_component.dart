import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key, this.iOSSize, this.androidSize, this.color}) : super(key: key);

  final double? iOSSize;
  final double? androidSize;
  final Color? color;

  Widget _getIndicatorWidget(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return CupertinoActivityIndicator(
          radius: iOSSize ?? 12.r,
          color: color ?? MainColors.primaryColor,
        );
      case TargetPlatform.android:
      default:
        return SizedBox(
          height: androidSize ?? 20.r,
          width: androidSize ?? 20.r,
          child: CircularProgressIndicator(
            color: color ?? MainColors.primaryColor,
            strokeWidth: 4.r,
            strokeCap: StrokeCap.round,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) => _getIndicatorWidget(Theme.of(context).platform);
}
