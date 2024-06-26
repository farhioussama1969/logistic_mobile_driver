import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> callPhone({required String phoneNUmber}) async {
    await launchUrl(Uri(scheme: 'tel', path: phoneNUmber));
  }

  static Future<void> chatWithWhatsapp({required String phoneNUmber, required String message}) async {
    await launchUrl(
      Uri.parse('https://wa.me/$phoneNUmber?text=$message'),
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> chatWithViber({required String phoneNUmber, required String message}) async {
    await launchUrl(
      Uri.parse('viber://chat/?number=$phoneNUmber&draft=$message'),
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<void> openLink({required String link, bool? internalLaunch}) async {
    await launchUrl(Uri.parse(link), mode: internalLaunch != true ? LaunchMode.externalApplication : LaunchMode.inAppWebView);
  }

  static Future<void> sendMail({required String mail}) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: mail,
    );
    await launchUrl(params);
  }
}
