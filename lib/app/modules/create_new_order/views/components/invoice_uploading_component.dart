import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loogisti/app/core/components/buttons/icon_button_component.dart';
import 'package:loogisti/app/core/components/inputs/image_input_component.dart';
import 'package:loogisti/app/core/constants/animations_assets_constants.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:lottie/lottie.dart';

class InvoiceUploadingComponent extends StatelessWidget {
  const InvoiceUploadingComponent({super.key, this.selectedInvoiceFile, required this.onFileSelected, required this.onFileRemoved});

  final File? selectedInvoiceFile;
  final Function(File file) onFileSelected;
  final Function() onFileRemoved;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageInputComponent(
          imageFile: selectedInvoiceFile,
          saveImage: onFileSelected,
          child: Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: MainColors.inputColor(context),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: MainColors.textColor(context)!.withOpacity(0.1),
                width: 1.r,
              ),
            ),
            child: selectedInvoiceFile == null
                ? Center(
                    child: Lottie.asset(AnimationsAssetsConstants.uploadAnimation),
                  )
                : Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: MainColors.textColor(context)!.withOpacity(0.1),
                        width: 1.r,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.file(
                        selectedInvoiceFile!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
          ),
        ),
        if (selectedInvoiceFile != null)
          Padding(
              padding: EdgeInsets.all(12.r),
              child: IconButtonComponent(
                onTap: onFileRemoved,
                iconLink: IconsAssetsConstants.closeIcon,
                iconColor: MainColors.errorColor(context),
                buttonHeight: 30.r,
                buttonWidth: 30.r,
                iconHeight: 16.r,
                iconWidth: 16.r,
              )),
      ],
    );
  }
}
