import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:loogisti/app/core/constants/images_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class ImageInputComponent extends StatefulWidget {
  Function(File)? saveImage;
  File? imageFile;
  Widget? child;
  bool? cropImage;
  bool? isRectangularImage;
  bool? disable;

  ImageInputComponent({super.key, this.saveImage, this.imageFile, this.child, this.cropImage, this.isRectangularImage, this.disable});

  @override
  _ImageInputComponentState createState() => _ImageInputComponentState();
}

class _ImageInputComponentState extends State<ImageInputComponent> {
  @override
  Widget build(BuildContext context) {
    Widget imagePlace = GestureDetector(
        onTap: () {
          if (widget.disable != true) _showChooses(context);
        },
        child: widget.child);
    return imagePlace;
  }

  _showChooses(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: MainColors.transparentColor,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.r, sigmaY: 3.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                  //height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        borderRadius: BorderRadius.circular(12.r),
                        onTap: () => _getImage(ImageSources.camera, widget.isRectangularImage),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 15.r),
                          decoration: BoxDecoration(
                              color: MainColors.backgroundColor(context),
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: MainColors.shadowColor(context)!.withOpacity(0.3),
                                  offset: const Offset(0, 0),
                                  spreadRadius: 0,
                                  blurRadius: 15.r,
                                ),
                              ]),
                          // height: 120.r,
                          width: 150.r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImagesAssetsConstants.cameraImage,
                                width: 60.r,
                              ),
                              SizedBox(height: 5.r),
                              Center(
                                child: Text(
                                  StringsAssetsConstants.camera,
                                  style: TextStyles.mediumBodyTextStyle(context),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      InkWell(
                        borderRadius: BorderRadius.circular(12.r),
                        onTap: () => _getImage(ImageSources.image, widget.isRectangularImage),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 15.r),
                          decoration: BoxDecoration(
                              color: MainColors.backgroundColor(context),
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: MainColors.shadowColor(context)!.withOpacity(0.3),
                                  offset: const Offset(0, 0),
                                  spreadRadius: 0,
                                  blurRadius: 15.r,
                                ),
                              ]),
                          // height: 120.r,
                          width: 150.r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImagesAssetsConstants.galleryImage,
                                width: 60.r,
                              ),
                              SizedBox(height: 5.r),
                              Center(
                                child: Text(
                                  StringsAssetsConstants.gallery,
                                  style: TextStyles.mediumBodyTextStyle(context),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          );
        });
  }

  _getImage(ImageSources source, bool? isRectangularImage) async {
    ImagePickerPlus picker = ImagePickerPlus(context);
    if (source == ImageSources.image) {
      SelectedImagesDetails? details = await picker.pickImage(
        source: ImageSource.gallery,
        multiImages: false,
        galleryDisplaySettings: GalleryDisplaySettings(
          callbackFunction: (imageDetails) async {
            if (imageDetails.selectedFiles.isNotEmpty == true) {
              setState(() {
                widget.imageFile = File(imageDetails!.selectedFiles[0].selectedFile.path);
                widget.saveImage!(File(imageDetails!.selectedFiles[0].selectedFile.path));
              });
              Navigator.pop(context);
              Navigator.pop(context);
            }
          },
          tabsTexts: TabsTexts(),
          appTheme: AppTheme(focusColor: Colors.white, primaryColor: Colors.black),
          cropImage: true,
          showImagePreview: true,
          maximumSelection: 1,
        ),
      );
    } else {
      SelectedImagesDetails? details = await picker.pickImage(
        source: ImageSource.camera,
        multiImages: false,
        galleryDisplaySettings: GalleryDisplaySettings(
          callbackFunction: (imageDetails) async {
            if (imageDetails.selectedFiles.isNotEmpty == true) {
              setState(() {
                widget.imageFile = File(imageDetails!.selectedFiles[0].selectedFile.path);
                widget.saveImage!(File(imageDetails!.selectedFiles[0].selectedFile.path));
              });
              Navigator.pop(context);
              Navigator.pop(context);
            }
          },
          tabsTexts: TabsTexts(),
          appTheme: AppTheme(focusColor: Colors.white, primaryColor: Colors.black),
          cropImage: true,
          showImagePreview: true,
          maximumSelection: 1,
        ),
      );
    }
  }
}

enum ImageSources { camera, image }
