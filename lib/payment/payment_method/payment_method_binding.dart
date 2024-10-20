import 'package:flutter_inappsubscriptions/payment/payment_method/payment_method_controller.dart';
import 'package:get/get.dart';

class PaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodController>(
      () => PaymentMethodController(),
    );
  }
}
