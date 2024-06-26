import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/data/providers/loogistic_api/config_provider.dart';

class AboutController extends GetxController {
  bool aboutLoading = false;
  void changeAboutLoading(bool value) {
    aboutLoading = value;
    update([GetBuildersIdsConstants.aboutBody]);
  }

  String? about;
  void changeAbout(String value) {
    about = value;
    update([GetBuildersIdsConstants.aboutBody]);
  }

  Future<void> getAbout() async {
    await ConfigProvider()
        .about(
      onLoading: () => changeAboutLoading(true),
      onFinal: () => changeAboutLoading(false),
    )
        .then((value) {
      if (value != null) {
        changeAbout(value);
        update([GetBuildersIdsConstants.aboutBody]);
      }
    });
  }

  @override
  void onInit() {
    getAbout();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
