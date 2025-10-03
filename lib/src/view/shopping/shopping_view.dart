import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/bottom_sheet/setting_bottom_sheet.dart';
import 'package:houseoftomorrow/theme/components/button/button.dart';
import 'package:houseoftomorrow/util/lang/generated/l10n.dart';
import 'package:provider/provider.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.shopping, style: context.typo.headline2),
        actions: [
          Button(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const SettingBottomSheet();
                },
              );
            },
            icon: 'option',
            type: ButtonType.flat,
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: context.read<ThemeService>().toggleTheme,
          child: Text("Toggle Theme", style: context.typo.headline6),
        ),
      ),
    );
  }
}
