import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loogisti/app/core/components/animations/loading_component.dart';
import 'package:loogisti/app/core/components/images/network_image_component.dart';
import 'package:loogisti/app/core/components/inputs/image_input_component.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';

class ProfileAvatarComponent extends StatelessWidget {
  const ProfileAvatarComponent(
      {super.key, required this.avatarLink, required this.pickedAvatarFile, required this.onPickAvatarFile, required this.loading});

  final String? avatarLink;
  final File? pickedAvatarFile;
  final Function(File? avatar) onPickAvatarFile;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ImageInputComponent(
      saveImage: (file) => onPickAvatarFile(file),
      imageFile: pickedAvatarFile,
      disable: loading,
      child: Stack(
        children: [
          Container(
            height: 130.r,
            width: 130.r,
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000.r),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  color: MainColors.shadowColor(context)!.withOpacity(0.3),
                  blurRadius: 10.r,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000.r),
              child: pickedAvatarFile != null
                  ? Image.file(
                      pickedAvatarFile!,
                      fit: BoxFit.cover,
                    )
                  : avatarLink != null
                      ? NetworkImageComponent(
                          imageLink: avatarLink ?? '',
                          errorWidget: Image.asset(
                            ImagesAssetsConstants.userPlaceholderImage,
                          ),
                          fit: BoxFit.cover)
                      : Image.asset(ImagesAssetsConstants.userPlaceholderImage, fit: BoxFit.cover),
            ),
          ),
          if (!loading)
            PositionedDirectional(
              bottom: 5.h,
              end: 10.r,
              child: Container(
                height: 30.r,
                width: 30.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000.r),
                  color: MainColors.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconsAssetsConstants.editSquareIcon,
                    width: 15.r,
                    color: MainColors.whiteColor,
                  ),
                ),
              ),
            ),
          if (loading)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: MainColors.blackColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(1000.r),
                ),
                child: const Center(
                  child: LoadingComponent(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
