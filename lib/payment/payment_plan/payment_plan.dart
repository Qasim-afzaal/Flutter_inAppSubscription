import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:sparkd/core/constants/imports.dart';
import 'package:sparkd/pages/terms_condition/terms_condition.dart';

import 'payment_plan_controller.dart';

class PaymentPlanPage extends StatelessWidget {
  const PaymentPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Screen Height: ${MediaQuery.of(context).size.height}");
    return GetBuilder(
      init: PaymentPlanController(inAppPurchaseSource: Get.find()),
      builder: (controller) {
        return Scaffold(
          appBar: const SparkdAppBarBeforePayment(),
          body: SafeArea(
            child: Column(
              children: [
                Text(
                  AppStrings.infiniteSparkd,
                  textAlign: TextAlign.center,
                  style: context.headlineMedium?.copyWith(
                    color: context.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ).paddingSymmetric(vertical: context.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Column(
                      icon: Assets.images.sparks,
                      text: AppStrings.unlimitedSparks,
                    ),
                    _Column(
                      icon: Assets.images.coach,
                      text: AppStrings.personalCoach,
                    ),
                    _Column(
                      icon: Assets.images.dates,
                      text: AppStrings.provenDates,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "RIZZ COACH",
                  textAlign: TextAlign.center,
                  style: context.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: (MediaQuery.of(context).size.height >= 667.0 &&
                              MediaQuery.of(context).size.height <= 695.0)
                          ? 22
                          : 26,
                      color: Theme.of(context).colorScheme.primary),
                ),
                SB.h(context.height * 0.06),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: context.height * 0.31,
                      padding: EdgeInsets.all(context.paddingDefault),
                      decoration: BoxDecoration(
                        color: context.cardColor,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: context.primary),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Get Unlimited sparks/chat with your premium \nRizz Coach Paid Subscription",
                            textAlign: TextAlign.center,
                            style: context.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            AppStrings.flameOn,
                            textAlign: TextAlign.center,
                            style: context.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AppButton.primary(
                            title: AppStrings.unlockFreeTrial,
                            onPressed: () {
                              if (controller.isLoading.value == false) {
                                controller.onSubscriptionPressed();
                              } else {
                                null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.flame.image(height: 22),
                              SB.w(8),
                              Text(
                                AppStrings.freeTrial,
                                textAlign: TextAlign.center,
                                style: context.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    fontSize: (MediaQuery.of(context).size.height >= 667.0 &&
                              MediaQuery.of(context).size.height <= 710.0)
                          ? 13:15),
                              ),
                              SB.w(8),
                              Assets.images.flame.image(height: 22),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: (MediaQuery.of(context).size.height >= 667.0 &&
                              MediaQuery.of(context).size.height <= 710.0)
                          ? -45: -55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.flameGroup.image(scale: (MediaQuery.of(context).size.height >= 667.0 &&
                              MediaQuery.of(context).size.height <= 710.0)
                          ? 3:2),
                        ],
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: context.paddingDefault),
                SB.h(20),
                Text(
                  Platform.isIOS
                      ? AppStrings.subscriptionWillRenewIOS
                      : AppStrings.subscriptionWillRenewAnd,
                  textAlign: TextAlign.center,
                  style: context.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w400, height: 1),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(() => TermsConditionPage());
                  },
                  child: Text(
                    AppStrings.termsConditions,
                    textAlign: TextAlign.center,
                    style: context.titleSmall?.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        height: 1),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Column extends StatelessWidget {
  const _Column({super.key, required this.icon, required this.text});

  final AssetGenImage icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon.image(
          height: 80,
          width: 80,
        ),
        SB.h(15),
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.titleMedium
              ?.copyWith(fontWeight: FontWeight.w400, height: 1),
        ),
      ],
    );
  }
}
