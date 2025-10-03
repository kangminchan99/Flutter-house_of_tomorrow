import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/model/product_model.dart';
import 'package:houseoftomorrow/util/lang/generated/l10n.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(S.current.product)));
  }
}
