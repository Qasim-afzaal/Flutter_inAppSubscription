import 'dart:io';

import 'package:flutter_inappsubscriptions/core/components/app_button.dart';
import 'package:flutter_inappsubscriptions/core/components/sb.dart';
import 'package:flutter_inappsubscriptions/core/constants/imports.dart';



mixin SocialSignIn {
  Widget socialButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton.borderIcon(
            // onTap: () => loginWithGoogle(),
            icon: Icon(Icons.abc)
          ),
          if (Platform.isIOS) ...[
            SB.w(15),
            AppButton.borderIcon(
              // onPressed: _signInWithApple,
            icon: Icon(Icons.abc)
            ),
          ]
        ],
      );
}
