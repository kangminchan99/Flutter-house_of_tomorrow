import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/bottom_sheet/setting_bottom_sheet.dart';
import 'package:houseoftomorrow/theme/components/button/button.dart';
import 'package:houseoftomorrow/theme/components/input_field.dart';
import 'package:houseoftomorrow/util/lang/generated/l10n.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                // 검색
                Expanded(child: InputField(hint: S.current.searchProduct)),
                const SizedBox(width: 16.0),
                // 검색 버튼
                Button(onPressed: () {}, icon: 'search'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
