import 'package:flutter/material.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) => RootKeyboardManager(child: child));
  }

  static Widget builder(BuildContext context, Widget? screen) =>
      RootWidget(child: screen!);
}

/// Manages the soft keyboard closing, forcing unfocus when not touching.
class RootKeyboardManager extends StatelessWidget {
  final Widget child;

  /// Allow close keyboard on tap.
  static bool allowCloseKeyboard = true;

  const RootKeyboardManager({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (allowCloseKeyboard) {
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
