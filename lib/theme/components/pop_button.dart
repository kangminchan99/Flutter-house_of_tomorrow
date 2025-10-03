import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/button/button.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () => Navigator.pop(context),
      icon: 'arrow-left',
      color: context.color.text,
      type: ButtonType.flat,
    );
  }
}
