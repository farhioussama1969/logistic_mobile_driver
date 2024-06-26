import 'dart:ui';

import 'package:get/get.dart';
import 'package:lit_relative_date_time/controller/relative_date_format.dart';
import 'package:lit_relative_date_time/model/relative_date_localization.dart';
import 'package:lit_relative_date_time/model/relative_date_time.dart';

class RelativeDateUtil {
  static Rx<RelativeDateFormat> relativeDateFormatter =
      RelativeDateFormat(Get.locale?.languageCode == "ar" ? const Locale("ar") : const Locale("en"), localizations: [
    const RelativeDateLocalization(
      languageCode: 'en',
      timeUnitsSingular: [
        'second',
        'minute',
        'hour',
        'day',
        'week',
        'month',
        'year',
      ],
      timeUnitsPlural: [
        'seconds',
        'minutes',
        'hours',
        'days',
        'weeks',
        'months',
        'years',
      ],
      prepositionPast: 'ago',
      prepositionFuture: 'in',
      atTheMoment: 'now',
      formatOrderPast: [FormatComponent.value, FormatComponent.unit, FormatComponent.preposition],
      formatOrderFuture: [
        FormatComponent.preposition,
        FormatComponent.value,
        FormatComponent.unit,
      ],
    ),
    const RelativeDateLocalization(
      languageCode: 'ar',
      timeUnitsSingular: [
        'ثواني',
        'دقائق',
        'ساعات',
        'أيام',
        'أسابيع',
        'أشهر',
        'سنوات',
      ],
      timeUnitsPlural: [
        'ثانية',
        'دقيقة',
        'ساعة',
        'يوم',
        'أسبوع',
        'شهر',
        'سنة',
      ],
      prepositionPast: 'منذ',
      prepositionFuture: 'بعد',
      atTheMoment: 'الآن',
      formatOrderPast: [
        FormatComponent.preposition,
        FormatComponent.value,
        FormatComponent.unit,
      ],
      formatOrderFuture: [
        FormatComponent.preposition,
        FormatComponent.value,
        FormatComponent.unit,
      ],
    )
  ]).obs;

  static void initializeRelativeDateFormat() {
    relativeDateFormatter.value =
        RelativeDateFormat(Get.locale?.languageCode == "ar" ? const Locale("ar") : const Locale("en"), localizations: [
      const RelativeDateLocalization(
        languageCode: 'en',
        timeUnitsSingular: [
          'second',
          'minute',
          'hour',
          'day',
          'week',
          'month',
          'year',
        ],
        timeUnitsPlural: [
          'seconds',
          'minutes',
          'hours',
          'days',
          'weeks',
          'months',
          'years',
        ],
        prepositionPast: 'ago',
        prepositionFuture: 'in',
        atTheMoment: 'now',
        formatOrderPast: [FormatComponent.value, FormatComponent.unit, FormatComponent.preposition],
        formatOrderFuture: [
          FormatComponent.preposition,
          FormatComponent.value,
          FormatComponent.unit,
        ],
      ),
      const RelativeDateLocalization(
        languageCode: 'ar',
        timeUnitsSingular: [
          'ثواني',
          'دقائق',
          'ساعات',
          'أيام',
          'أسابيع',
          'أشهر',
          'سنوات',
        ],
        timeUnitsPlural: [
          'ثانية',
          'دقيقة',
          'ساعة',
          'يوم',
          'أسبوع',
          'شهر',
          'سنة',
        ],
        prepositionPast: 'منذ',
        prepositionFuture: 'بعد',
        atTheMoment: 'الآن',
        formatOrderPast: [
          FormatComponent.preposition,
          FormatComponent.value,
          FormatComponent.unit,
        ],
        formatOrderFuture: [
          FormatComponent.preposition,
          FormatComponent.value,
          FormatComponent.unit,
        ],
      )
    ]);
    relativeDateFormatter.refresh();
  }

  static String getRelativeDateSinceNow({required int relativeDateInUnix}) {
    return relativeDateFormatter().format(
      RelativeDateTime(dateTime: DateTime.now(), other: DateTime.fromMillisecondsSinceEpoch(relativeDateInUnix)),
    );
  }

  static int getUnixTimeFromDateTime(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }

// static String? getDurationFromDaysNumber(int? days) {
//   if (days == 1) {
//     return StringsAssetsConstants.day;
//   } else if (days == 7) {
//     return StringsAssetsConstants.week;
//   } else if (days == 15) {
//     return StringsAssetsConstants.twoWeek;
//   } else if (days == 30) {
//     return StringsAssetsConstants.month;
//   } else if (days == 60) {
//     return StringsAssetsConstants.twoMonths;
//   } else if (days == 180) {
//     return '6 ${StringsAssetsConstants.months}';
//   } else if (days == 365) {
//     return StringsAssetsConstants.year;
//   }
// }
}
