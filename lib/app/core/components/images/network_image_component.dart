import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:loogisti/app/core/constants/animations_assets_constants.dart';
import 'package:loogisti/app/core/constants/logos_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class NetworkImageComponent extends StatelessWidget {
  const NetworkImageComponent({Key? key, required this.imageLink, this.fit, this.errorWidget, this.thumb}) : super(key: key);

  final String imageLink;
  final String? thumb;
  final BoxFit? fit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: imageLink,
        fit: fit ?? BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: MainColors.whiteColor,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Container(
              decoration: BoxDecoration(
                color: MainColors.inputColor(context),
              ),
              child: Center(
                child: Lottie.asset(
                  AnimationsAssetsConstants.noInternetAnimation,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
      ),
    );
  }
}
