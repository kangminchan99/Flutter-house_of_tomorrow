import 'package:flutter/material.dart';

class HideKeyboard extends StatelessWidget {
  final Widget child;
  const HideKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: child,
    );
  }
}
