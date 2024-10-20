import 'package:flutter_inappsubscriptions/payment/payment_confirmation/payment_confirmation.dart';
import 'package:flutter_inappsubscriptions/payment/payment_method/payment_method.dart';

import '../../../core/constants/imports.dart';

class PaymentMethodController extends GetxController {
  String? selectedPaymentMethod;

  final List<PaymentUIModel> paymentMethodsList = [
    PaymentUIModel(
        title: "Master Card",
        image: Image(image: AssetImage("")),
        description: 'xxxx - xxxx - xxxx - 8973'),
    PaymentUIModel(
      title: "Apple pay",
      image: Image(image: AssetImage("")),
    ),
    PaymentUIModel(
      title: "Google pay",
      image: Image(image: AssetImage("")),
    ),
  ];

  void onPaymentMethodSelection(String paymentMethod) {
    if (paymentMethod != selectedPaymentMethod) {
      selectedPaymentMethod = paymentMethod;

      update();
    }
  }

  void navigateToPaymentConfirmation() =>
      Get.to(() => const PaymentConfirmationPage());
}
