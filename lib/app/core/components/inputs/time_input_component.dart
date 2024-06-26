import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class TimeInputComponent extends StatelessWidget {
  Widget child;

  Function(DateTime)? callBack;
  DateTime? selectedDate;

  TimeInputComponent({required this.child, this.callBack, this.selectedDate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _selectDate(context);
        },
        child: child);
  }

  _selectDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    DateTime? newSelectedDate = await DatePicker.showTimePicker(
      context,
      showTitleActions: true,
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
      showSecondsColumn: false,
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
    }
  }
}
