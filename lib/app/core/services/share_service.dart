import 'dart:developer';

import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> shareTextContent({required String content}) async {
    ShareResult result = await Share.shareWithResult(content);
    if (result.status == ShareResultStatus.success) {
      log('Thank you for sharing my website!');
    }
  }
}
