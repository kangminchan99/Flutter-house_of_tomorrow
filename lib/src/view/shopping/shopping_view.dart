import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/model/product_model.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/src/view/shopping/widgets/product_card_grid.dart';
import 'package:houseoftomorrow/src/view/shopping/widgets/product_empty.dart';
import 'package:houseoftomorrow/theme/components/bottom_sheet/setting_bottom_sheet.dart';
import 'package:houseoftomorrow/theme/components/button/button.dart';
import 'package:houseoftomorrow/theme/components/hide_keyboard.dart';
import 'package:houseoftomorrow/theme/components/input_field.dart';
import 'package:houseoftomorrow/util/helper/network_helper.dart';
import 'package:houseoftomorrow/util/lang/generated/l10n.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  List<ProductModel> productList = [];

  TextEditingController textEditingController = TextEditingController();

  String get keyword => textEditingController.text.trim();

  Future<void> searchProductList() async {
    try {
      final response = await NetworkHelper.dio.get(
        'https://gist.githubusercontent.com/nero-angela/d16a5078c7959bf5abf6a9e0f8c2851a/raw/04fb4d21ddd1ba06f0349a890f5e5347d94d677e/ikeaSofaDataIBB.json',
      );

      setState(() {
        productList = jsonDecode(response.data)
            .map<ProductModel>((json) {
              return ProductModel.fromJson(json);
            })
            .where((product) {
              // 검색어 없으면 모두 표시
              if (keyword.isEmpty) return true;

              // name이나 brand에 키워드 포함 여부 확인
              return "${product.name}${product.brand}".toLowerCase().contains(
                keyword.toLowerCase(),
              );
            })
            .toList();
      });
    } catch (e, s) {
      log('Failed to load product list', error: e, stackTrace: s);
    }
  }

  @override
  void initState() {
    super.initState();
    searchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: Scaffold(
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
                  Expanded(
                    child: InputField(
                      hint: S.current.searchProduct,
                      controller: textEditingController,
                      onClear: searchProductList,
                      onSubmitted: (text) => searchProductList(),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  // 검색 버튼
                  Button(onPressed: searchProductList, icon: 'search'),
                ],
              ),
            ),
            // ProductCardList
            Expanded(
              child: productList.isEmpty
                  ? ProductEmpty()
                  : ProductCardGrid(productList),
            ),
          ],
        ),
      ),
    );
  }
}
