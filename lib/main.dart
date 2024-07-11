import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/firebase_messaging_tobics_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/core/styles/theme_styles.dart';
import 'package:loogisti/app/core/utils/theme_util.dart';
import 'package:loogisti/app/core/utils/translation_util.dart';
import 'package:loogisti/app/core/utils/translations/translation.dart';
import 'package:loogisti/app/core/utils/translations/translations_assets_reader.dart';
import 'package:loogisti/app/modules/config_controller.dart';
import 'package:loogisti/app/modules/user_controller.dart';

import 'app/core/services/local_notification_service.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

late final FirebaseMessaging _messaging;

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  LocalStorageService.saveData(key: StorageKeysConstants.newNotification, type: DataTypes.bool, value: true);
}

Future<void> requestAndRegisterNotification() async {
  await Firebase.initializeApp();
  _messaging = FirebaseMessaging.instance;
  print('firebase token: ${await _messaging.getToken()}');
  if (await LocalStorageService.loadData(key: StorageKeysConstants.fcmToken, type: DataTypes.string) == null) {
    _messaging.getToken().then((token) async {
      print('firebase token: ${token}');
      LocalStorageService.saveData(key: StorageKeysConstants.fcmToken, type: DataTypes.string, value: token);
      _messaging.subscribeToTopic(FirebaseMessagingTobicsConstants.allClients);
    });
  }

  NotificationSettings settings = await _messaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        LocalNotificationService.showNotification(title: message.notification?.title, body: message.notification?.body);
        LocalStorageService.saveData(key: StorageKeysConstants.newNotification, type: DataTypes.bool, value: true);
        if (Get.isRegistered<HomeController>()) {
          Get.find<HomeController>().changeIsThereIsANewNotification(true);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {});
  }
}

void startFirebaseCrashlytics() {
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await TranslationsAssetsReader.initialize();
  await TranslationUtil.initialize();
  await ThemeUtil.initialize();

  LocalNotificationService.initialize();
  await requestAndRegisterNotification();
  FirebaseAnalytics.instance;
  startFirebaseCrashlytics();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Get.put(ConfigController(), permanent: true);
  Get.put(UserController(), permanent: true);
  runApp(
    ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: GetMaterialApp(
            transitionDuration: const Duration(milliseconds: 300),
            defaultTransition: Transition.noTransition,
            debugShowCheckedModeBanner: false,
            title: 'Loogisti Driver',
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            translations: Translation(),
            locale: TranslationUtil.currentLang,
            fallbackLocale: const Locale('en'),
            themeMode: ThemeUtil.currentTheme,
            theme: ThemeStyles.lightTheme,
            darkTheme: ThemeStyles.darkTheme,
            // builder: EasyLoading.init(),
          ),
        );
      },
    ),
  );
}
