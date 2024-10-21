

import 'package:flutter_inappsubscriptions/core/splash/splash.dart';
import 'package:flutter_inappsubscriptions/core/splash/splash_binding.dart';
import 'package:flutter_inappsubscriptions/payment/payment_confirmation/payment_confirmation.dart';
import 'package:flutter_inappsubscriptions/payment/payment_confirmation/payment_confirmation_binding.dart';
import 'package:flutter_inappsubscriptions/payment/payment_method/payment_method.dart';
import 'package:flutter_inappsubscriptions/payment/payment_method/payment_method_binding.dart';
import 'package:flutter_inappsubscriptions/payment/payment_plan/payment_plan.dart';
import 'package:flutter_inappsubscriptions/payment/payment_plan/payment_plan_binding.dart';
import 'package:flutter_inappsubscriptions/settings/settings.dart';
import 'package:flutter_inappsubscriptions/settings/settings_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => const SplashPage(), binding: SplashBinding()),

    GetPage(name: _Paths.PAYMENT_CONFIRMATION, page: () => const PaymentConfirmationPage(), binding: PaymentConfirmationBinding()),
    GetPage(name: _Paths.PAYMENT_METHOD, page: () => const PaymentMethodPage(), binding: PaymentMethodBinding()),
    GetPage(name: _Paths.PAYMENT_PLAN, page: () => const PaymentPlanPage(), binding: PaymentPlanBinding()),

    GetPage(name: _Paths.SETTINGS, page: () => const SettingsPage(), binding: SettingsBinding()),
  ];
}
