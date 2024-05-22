import 'package:flutter/material.dart';

class MyRootWidget extends StatelessWidget {
  const MyRootWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) => RootKeyboardManager(child: child));
  }

  static Widget builder(BuildContext context, Widget? screen) =>
      MyRootWidget(child: screen!);
}

/// Manages the soft keyboard closing, forcing unfocus when not touching.
class RootKeyboardManager extends StatelessWidget {
  const RootKeyboardManager({super.key, required this.child});
  final Widget child;

  /// Allow close keyboard on tap.
  static bool allowCloseKeyboard = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (allowCloseKeyboard) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
