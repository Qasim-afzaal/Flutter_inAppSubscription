import 'package:flutter/material.dart';
import 'package:flutter_inappsubscriptions/core/constants/imports.dart';
import 'package:flutter_inappsubscriptions/payment/payment_plan/payment_plan_controller.dart';
import 'package:flutter_inappsubscriptions/settings/inapp_purchase_source.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp(const MyApp());
}

PaymentPlanController getPaymentPlanController() {
  if (Get.isRegistered<PaymentPlanController>()) {
    debugPrint("Payment Dependencies already register");
    return Get.find<PaymentPlanController>();
  } else {
    debugPrint("Payment Dependencies going to register");
    Get.lazyPut<InAppPurchaseSource>(
      () => InAppPurchaseSourceImpl(),
      fenix: true,
    );

    Get.lazyPut<PaymentPlanController>(
      () => PaymentPlanController(inAppPurchaseSource: Get.find<InAppPurchaseSource>()),
      fenix: true,
    );
    return Get.find<PaymentPlanController>();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(""));
  }
}