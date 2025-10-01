import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';

class AssetIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;
  const AssetIcon(this.icon, {super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      colorFilter: ColorFilter.mode(
        color ?? context.color.text,
        BlendMode.srcIn,
      ),
      width: size,
      height: size,
    );
  }
}
