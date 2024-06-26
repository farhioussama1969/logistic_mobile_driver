import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/data/providers/loogistic_api/config_provider.dart';

class ContactController extends GetxController {
  bool contactLoading = false;
  void changeContactLoading(bool value) {
    contactLoading = value;
    update([GetBuildersIdsConstants.contactBody]);
  }

  String? contact;
  void changeTermsAndConditions(String value) {
    contact = value;
    update([GetBuildersIdsConstants.contactBody]);
  }

  Future<void> getContact() async {
    await ConfigProvider()
        .termsAndConditions(
      onLoading: () => changeContactLoading(true),
      onFinal: () => changeContactLoading(false),
    )
        .then((value) {
      if (value != null) {
        changeTermsAndConditions(value);
        update([GetBuildersIdsConstants.contactBody]);
      }
    });
  }

  @override
  void onInit() {
    getContact();
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
