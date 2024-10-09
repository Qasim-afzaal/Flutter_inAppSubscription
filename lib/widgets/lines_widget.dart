
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_inappsubscriptions/core/components/sb.dart';
import 'package:flutter_inappsubscriptions/core/constants/imports.dart';
import 'package:flutter_inappsubscriptions/core/extensions/build_context_extension.dart';


class LinesWidget extends StatefulWidget {
  const LinesWidget({
    super.key,
    // required this.data,
    this.showCloseIcon = false,
    this.enableTap = true,
  });

  // final SparkLinesModel data;
  final bool showCloseIcon;
  final bool enableTap;

  @override
  State<LinesWidget> createState() => _LinesWidgetState();
}

class _LinesWidgetState extends State<LinesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: context.chatBubbleColor,
        border: Border.all(
          color: context.primary,
        ),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
       onTap: widget.enableTap
    ? () async {
        // Check connectivity status before proceeding
        var connectivityResult = await Connectivity().checkConnectivity();
        
        // Print the result for debugging
        print('Connectivity Result: $connectivityResult');
        
        if (connectivityResult != ConnectivityResult.none) {
          // If internet is available, handle the message
       
        } else {
          // No internet connection, show snackbar and stop further execution
          Get.snackbar(
            "No Internet",
            "Please check your internet connection and try again.",
            snackPosition: SnackPosition.BOTTOM,
          );
          return; // Prevent further execution if no internet
        }
      }
    : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset(
            //   data.iconPath,
            //   height: 32,
            //   width: 32,
            // ),
            SB.w(8),
            // Text(
            //   widget.data.text.length > 26
            //       ? widget.data.text.substring(0, 26) + '...'
            //       : widget.data.text,
            //   style: context.bodyLarge?.copyWith(
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),

            if (widget.showCloseIcon) ...[
              SB.w(8),
              Icon(Icons.close),
            ]
          ],
        ),
      ),
    );
  }

}

