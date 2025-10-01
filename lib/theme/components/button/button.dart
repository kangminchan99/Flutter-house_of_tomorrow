import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/asset_icon.dart';

part 'button_size.dart';
part 'button_type.dart';

class Button extends StatefulWidget {
  // 클릭 이벤트
  final void Function() onPressed;

  // 버튼 타입 & 크기
  final ButtonType type;
  final ButtonSize size;

  // 버튼 비활성화 여부
  final bool isInactive;

  // 버튼 텍스트 & 아이콘
  final String? text;
  final String? icon;

  // 폭
  final double? width;

  // 커스텀 색상
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  const Button({
    super.key,
    required this.onPressed,
    ButtonType? type,
    ButtonSize? size,
    bool? isInactive,
    this.text,
    this.icon,
    this.width,
    this.color,
    this.backgroundColor,
    this.borderColor,
  }) : type = type ?? ButtonType.fill,
       size = size ?? ButtonSize.medium,
       isInactive = isInactive ?? false;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  // 버튼이 눌려있는지 여부
  bool isPressed = false;

  // 비활성화 여부
  bool get isInactive => isPressed || widget.isInactive;

  // Text & Icon Color
  Color get color => widget.type.getColor(context, isInactive, widget.color);

  // Background Color
  Color get backgroundColor => widget.type.getBackgroundColor(
    context,
    isInactive,
    widget.backgroundColor,
  );

  // Border
  Border? get border =>
      widget.type.getBorder(context, isInactive, widget.borderColor);

  // 버튼 클릭 이벤트
  void onPressed(bool newIsPressed) {
    if (isPressed == newIsPressed) return;
    setState(() {
      isPressed = newIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (_) => onPressed(true),
      onTapCancel: () => onPressed(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            if (widget.icon != null) AssetIcon(widget.icon!, color: color),
            // Gap
            if (widget.icon != null && widget.text != null)
              const SizedBox(width: 8),
            // Text
            if (widget.text != null)
              Text(
                widget.text!,
                style: widget.size
                    .getTextStyle(context)
                    .copyWith(color: color, fontWeight: context.typo.semiBold),
              ),
          ],
        ),
      ),
    );
  }
}
