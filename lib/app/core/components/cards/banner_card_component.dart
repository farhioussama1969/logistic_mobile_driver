import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
import 'package:loogisti/app/core/services/url_launcher_service.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/data/models/banner_model.dart';

class BannerCardComponent extends StatelessWidget {
  const BannerCardComponent({super.key, required this.bannerData});

  final BannerModel bannerData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (bannerData.type == "External") {
          UrlLauncherService.openLink(link: bannerData.link ?? "");
        } else if (bannerData.type == "Internal") {}
      },
      child: Container(
        decoration: BoxDecoration(
          color: MainColors.backgroundColor(context),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: MainColors.textColor(context)!.withOpacity(0.05),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: NetworkImageComponent(
            imageLink: bannerData.image!.url!,
          ),
        ),
      ),
    );
    //: const BannerShimmerComponent();
  }
}
