import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/asset_icon.dart';

class Tile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final void Function() onPressed;
  const Tile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Start Icon
            AssetIcon(icon),
            const SizedBox(width: 8),
            // Title
            Expanded(child: Text(title, style: context.typo.headline5)),
            const SizedBox(width: 8),
            // Subtitle
            Text(
              subtitle,
              style: context.typo.subtitle1.copyWith(
                color: context.color.primary,
              ),
            ),
            const SizedBox(width: 8),
            // End Icon
            AssetIcon('chevron-right'),
          ],
        ),
      ),
    );
  }
}
