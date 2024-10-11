import 'dart:io';

import 'package:sparkd/core/constants/imports.dart';

mixin SocialSignIn {
  Widget socialButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton.borderIcon(
            // onTap: () => loginWithGoogle(),
            icon: Assets.icons.google.svg(),
          ),
          if (Platform.isIOS) ...[
            SB.w(15),
            AppButton.borderIcon(
              // onPressed: _signInWithApple,
              icon: Assets.icons.apple.svg(),
            ),
          ]
        ],
      );
}
