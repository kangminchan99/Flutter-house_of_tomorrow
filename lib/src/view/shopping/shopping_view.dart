import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/bottom_sheet/setting_bottom_sheet.dart';
import 'package:houseoftomorrow/theme/components/button/button.dart';
import 'package:houseoftomorrow/theme/components/input_field.dart';
import 'package:houseoftomorrow/util/helper/network_helper.dart';
import 'package:houseoftomorrow/util/lang/generated/l10n.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  List productList = [];

  Future<void> searchProductList() async {
    try {
      final response = await NetworkHelper.dio.get(
        'https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json',
      );

      print(response.data);
    } catch (e, s) {
      log('Failed to load product list', error: e, stackTrace: s);
    }
  }

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
                Button(onPressed: searchProductList, icon: 'search'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
