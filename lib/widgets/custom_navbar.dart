
import 'package:flutter_inappsubscriptions/core/constants/imports.dart';
import 'package:flutter_inappsubscriptions/core/extensions/build_context_extension.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int)? onTabTapped;
  const CustomBottomNavBar({super.key, this.selectedIndex = 0, this.onTabTapped});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  List navIconList = [
    
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65 + context.paddingBottom,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
          context.secondary,
          context.primary,
        ]),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < navIconList.length; i++)
            InkWell(
              onTap: () {
                if (widget.onTabTapped != null) {
                  widget.onTabTapped!(i);
                }
                if (i == 3) {
                  // Get.put(InboxController()).onInit();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  children: [

                    navIconList[i].svg(
                      height: 25.0,
                      color: widget.selectedIndex != i ? context.grey : context.scaffoldBackgroundColor,
                    ),
                    // widget.selectedIndex == i
                    //     ? Container(
                    //         width: 6,
                    //         height: 6,
                    //         margin: const EdgeInsets.only(top: 4),
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: context.primary,
                    //         ),
                    //       )
                    //     : const SizedBox.shrink()
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
