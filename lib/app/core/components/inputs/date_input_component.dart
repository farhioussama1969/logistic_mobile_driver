import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class DateInputComponent extends StatelessWidget {
  Widget? child;
  FocusNode? focusNode;
  FocusNode? nextNode;
  TextEditingController? textController;
  String? error;
  Function(DateTime)? callBack;
  DateTime? selectedDate;
  DateTime? firstDate;
  DateTime? lastDate;
  bool? filled;
  double? borderRadius;
  Widget? prefix;
  Widget? suffix;
  bool? isLabelOutside;
  String? label;
  Function(String value)? validate;
  EdgeInsetsGeometry? contentPadding;
  String? hint;
  Color? borderColor;
  Color? fillColor;

  DateInputComponent(
      {this.child,
      this.focusNode,
      this.nextNode,
      this.textController,
      this.error,
      this.callBack,
      this.selectedDate,
      this.hint,
      this.lastDate,
      this.firstDate,
      this.filled,
      this.borderRadius,
      this.prefix,
      this.suffix,
      this.isLabelOutside,
      this.label,
      this.validate,
      this.contentPadding,
      this.borderColor,
      this.fillColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatorComponent(
      time: const Duration(milliseconds: 300),
      child: child ??
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                (isLabelOutside != null && isLabelOutside == true)
                    ? Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(bottom: 5.h, start: 14.w),
                              child: Text(
                                label == null ? "" : label!,
                                style: TextStyles.mediumBodyTextStyle(context),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
                TextFormField(
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  style: TextStyles.mediumBodyTextStyle(context),
                  focusNode: focusNode,
                  controller: textController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.grey,
                  validator: (value) {
                    if (validate == null) return null;
                    return validate!(value!);
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: label == null
                        ? null
                        : Text(
                            label!,
                            style: TextStyles.mediumBodyTextStyle(context).copyWith(
                              color: MainColors.textColor(context),
                              fontSize: 20.sp,
                            ),
                          ),
                    labelStyle: TextStyles.mediumBodyTextStyle(context).copyWith(
                      color: MainColors.textColor(context),
                    ),
                    counterText: '',
                    hintStyle: TextStyles.mediumBodyTextStyle(context).copyWith(
                      color: MainColors.disableColor(context),
                    ),
                    contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                    errorStyle: TextStyles.smallBodyTextStyle(context).copyWith(
                      color: MainColors.errorColor(context),
                      fontSize: 13.sp,
                      overflow: TextOverflow.fade,
                    ),
                    errorMaxLines: 2,
                    fillColor: fillColor ?? MainColors.inputColor(context),
                    filled: filled ?? true,
                    hintText: hint ?? "",
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                      borderSide: BorderSide(
                        color: MainColors.errorColor(context)!,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                      borderSide: BorderSide(
                        color: borderColor ?? MainColors.disableColor(context)!.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                      borderSide: BorderSide(
                        color: borderColor ?? MainColors.disableColor(context)!.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                      borderSide: BorderSide(
                        color: MainColors.primaryColor,
                        width: 1,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                      borderSide: BorderSide(
                        color: borderColor ?? MainColors.disableColor(context)!.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 25.w,
                      minHeight: 25.w,
                    ),
                    prefixIcon: prefix != null
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              prefix ?? Container(),
                            ],
                          )
                        : null,
                    suffixIcon: suffix != null
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              suffix ?? Container(),
                            ],
                          )
                        : null,
                  ),
                  onFieldSubmitted: (_) {
                    nextNode == null ? FocusScope.of(context).unfocus() : FocusScope.of(context).requestFocus(nextNode);
                  },
                ),
              ],
            ),
          ),
    );
  }

  _selectDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    DateTime? newSelectedDate = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: firstDate,
      maxTime: lastDate,
      theme: picker.DatePickerTheme(
        backgroundColor: MainColors.backgroundColor(context)!,
        cancelStyle: TextStyles.mediumLabelTextStyle(context),
        doneStyle: TextStyles.mediumLabelTextStyle(context).copyWith(
          color: MainColors.primaryColor,
        ),
        itemStyle: TextStyles.largeBodyTextStyle(context).copyWith(
          fontSize: 19.sp,
        ),
        headerColor: MainColors.backgroundColor(context),
      ),
      onChanged: (date) {
        print('change $date');
      },
      onConfirm: (date) {
        print('confirm $date');
      },
      currentTime: selectedDate,
      locale: Get.locale?.languageCode == 'en'
          ? LocaleType.en
          : Get.locale?.languageCode == 'fr'
              ? LocaleType.fr
              : LocaleType.ar,
    );

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      if (callBack != null) {
        callBack!(selectedDate!);
      }
      if (textController != null) {
        textController?.text = DateFormat('yyyy-MM-dd', 'en').format(selectedDate!);
      }
    }
  }
}
