import 'package:flutter_inappsubscriptions/core/constants/imports.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assetName"),
                fit: BoxFit.cover,
              ),
            ),
            // child: Center(
            //   child: Assets.images.logo.image(
            //     width: context.width * 0.7,
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
