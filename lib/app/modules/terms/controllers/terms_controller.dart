import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/data/providers/loogistic_api/config_provider.dart';

class TermsController extends GetxController {
  bool termsAndConditionsLoading = false;
  void changeTermsAndConditionsLoading(bool value) {
    termsAndConditionsLoading = value;
    update([GetBuildersIdsConstants.termsAndConditionsBody]);
  }

  String? termsAndConditions;
  void changeTermsAndConditions(String value) {
    termsAndConditions = value;
    update([GetBuildersIdsConstants.termsAndConditionsBody]);
  }

  Future<void> getTermsAndConditions() async {
    await ConfigProvider()
        .termsAndConditions(
      onLoading: () => changeTermsAndConditionsLoading(true),
      onFinal: () => changeTermsAndConditionsLoading(false),
    )
        .then((value) {
      if (value != null) {
        changeTermsAndConditions(value);
        update([GetBuildersIdsConstants.termsAndConditionsBody]);
      }
    });
  }

  @override
  void onInit() {
    getTermsAndConditions();
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
