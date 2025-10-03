import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/model/product_model.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/rating.dart';
import 'package:houseoftomorrow/util/helper/intl_helper.dart';
import 'package:houseoftomorrow/util/route_path.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePath.product, arguments: product);
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: context.color.surface,
          boxShadow: context.deco.shadow,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.productColorList.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  product.productColorList.first.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 4),
            Text(
              product.name.toString(),
              style: context.typo.headline4.copyWith(
                fontWeight: context.typo.semiBold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.brand.toString(),
              style: context.typo.body2.copyWith(
                fontWeight: context.typo.light,
                color: context.color.subtext,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    IntlHelper.currency(
                      symbol: product.priceUnit,
                      number: product.price,
                    ),
                    style: context.typo.subtitle2,
                  ),
                ),
                Rating(rating: product.rating),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
