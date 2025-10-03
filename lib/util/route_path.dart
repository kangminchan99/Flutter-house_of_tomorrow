import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/model/product_model.dart';
import 'package:houseoftomorrow/src/view/product/product_view.dart';
import 'package:houseoftomorrow/src/view/shopping/shopping_view.dart';

abstract class RoutePath {
  static const String shopping = 'shopping';
  static const String product = 'product';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;

    switch (settings.name) {
      case RoutePath.shopping:
        page = const ShoppingView();
        break;
      case RoutePath.product:
        ProductModel product = settings.arguments as ProductModel;
        page = ProductView(product: product);
        break;
    }

    return MaterialPageRoute(builder: (context) => page);
  }
}
