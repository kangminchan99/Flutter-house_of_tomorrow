import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/model/product_model.dart';
import 'package:houseoftomorrow/src/view/product/widgets/product_color_preview.dart';
import 'package:houseoftomorrow/theme/color_picker.dart';
import 'package:houseoftomorrow/theme/components/pop_button.dart';
import 'package:houseoftomorrow/util/lang/generated/l10n.dart';

class ProductView extends StatefulWidget {
  final ProductModel product;
  const ProductView({super.key, required this.product});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  // 선택한 수량
  int count = 1;

  // 선택한 색상
  int colorIndex = 0;

  // 수량 업데이트 이벤트 함수
  void onCountChanged(int newCount) {
    setState(() {
      count = newCount;
    });
  }

  // 색상 업데이트 이벤트 함수
  void onColorIndexChanged(int newColorIndex) {
    setState(() {
      colorIndex = newColorIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.product),
        titleSpacing: 0,
        leading: const PopButton(),
      ),
      body: Wrap(
        runSpacing: 32.0,
        alignment: WrapAlignment.center,
        children: [
          // Product Color Preview
          ProductColorPreview(colorIndex: colorIndex, product: widget.product),

          // Color Picker
          ColorPicker(
            colorIndex: colorIndex,
            colorsList: widget.product.productColorList.map((e) {
              return e.color;
            }).toList(),
            onColorSelected: onColorIndexChanged,
          ),
        ],
      ),
    );
  }
}
