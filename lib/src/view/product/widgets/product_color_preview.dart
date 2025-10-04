import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/model/product_model.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/util/helper/intl_helper.dart';

class ProductColorPreview extends StatelessWidget {
  final int colorIndex;
  final ProductModel product;
  const ProductColorPreview({
    super.key,
    required this.colorIndex,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: context.deco.shadow,
      ),
      padding: const EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Image.network(
              product.productColorList[colorIndex].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16.0),
          // Name
          Text(
            product.name.toString(),
            style: context.typo.headline1.copyWith(
              fontWeight: context.typo.semiBold,
            ),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              // Brand
              Text(
                product.brand.toString(),
                style: context.typo.subtitle1.copyWith(
                  color: context.color.subtext,
                  fontWeight: context.typo.light,
                ),
              ),
              const Spacer(),
              // Price
              Text(
                IntlHelper.currency(
                  symbol: product.priceUnit,
                  number: product.price,
                ),
                style: context.typo.headline6.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
