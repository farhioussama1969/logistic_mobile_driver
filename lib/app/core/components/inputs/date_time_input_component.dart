import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:loogisti/app/core/components/animations/animator_component.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class DateTimeInputComponent extends StatelessWidget {
  Widget child;

  Function(DateTime)? callBack;
  DateTime? selectedDate;
  DateTime? firstDate;
  DateTime? lastDate;

  DateTimeInputComponent({required this.child, this.callBack, this.selectedDate, this.lastDate, this.firstDate, Key? key})
      : super(key: key);

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
    DateTime? newSelectedDate = await DatePicker.showDateTimePicker(
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
    }
  }
}
