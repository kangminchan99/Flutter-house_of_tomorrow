import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/asset_icon.dart';

class Rating extends StatelessWidget {
  final String rating;
  const Rating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetIcon('star', color: context.color.tertiary, size: 20),
        const SizedBox(width: 6),
        Text(
          rating,
          style: context.typo.body1.copyWith(
            color: context.color.subtext,
            fontWeight: context.typo.light,
          ),
        ),
      ],
    );
  }
}
