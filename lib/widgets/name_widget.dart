
import 'package:flutter_inappsubscriptions/core/components/app_button.dart';
import 'package:flutter_inappsubscriptions/core/components/app_text_field.dart';
import 'package:flutter_inappsubscriptions/core/components/sb.dart';
import 'package:flutter_inappsubscriptions/core/constants/app_strings.dart';
import 'package:flutter_inappsubscriptions/core/constants/imports.dart';
import 'package:flutter_inappsubscriptions/core/extensions/build_context_extension.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});
  // final GatherNewChatInfoController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.allSet,
          style: context.headlineMedium?.copyWith(
            color: context.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SB.h(10),
        Text(
          AppStrings.allSetDescription,
          textAlign: TextAlign.center,
          style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w400, height: 1),
        ),
        SB.h(40),
        CustomTextField(
          // controller: controller.nameController,
          title: AppStrings.name,
        ),
        SB.h(25),
        AppButton.primary(
          title:" AppStrings.getMySparkd",
          // onPressed: controller.getSparkd,
        )
      ],
    ).paddingAll(context.paddingDefault);
  }
}
