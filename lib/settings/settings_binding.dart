import 'package:flutter_inappsubscriptions/settings/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {


    Get.lazyPut<SettingsController>(
          () => SettingsController(inAppPurchaseSource: Get.find()),
    );
  }
}