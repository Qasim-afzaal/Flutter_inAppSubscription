
import 'package:flutter_inappsubscriptions/core/components/app_button.dart';
import 'package:flutter_inappsubscriptions/core/components/sb.dart';
import 'package:flutter_inappsubscriptions/core/constants/app_strings.dart';
import 'package:flutter_inappsubscriptions/core/constants/imports.dart';
import 'package:flutter_inappsubscriptions/core/extensions/build_context_extension.dart';

import 'payment_confirmation_controller.dart';

class PaymentConfirmationPage extends StatelessWidget {
  const PaymentConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PaymentConfirmationController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage(""),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.paymentConfirmation,
                    textAlign: TextAlign.center,
                    style: context.headlineMedium?.copyWith(
                      color: context.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SB.h(15),
                  Text(
                    AppStrings.paymentConfirmationDescription,
                    textAlign: TextAlign.center,
                    style: context.titleLarge?.copyWith(
                      color: context.onPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SB.h(35),
                  AppButton.primary(
                    title: AppStrings.letsGo,
                    onPressed: () => {},
                  ).paddingAll(context.paddingDefault),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
