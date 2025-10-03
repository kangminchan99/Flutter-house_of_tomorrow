import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';
import 'package:houseoftomorrow/theme/components/button/button.dart';

class InputField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;
  const InputField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {});
      },
      onSubmitted: widget.onSubmitted,
      style: context.typo.headline5,
      cursorColor: context.color.primary,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: context.color.hintContainer,
        hintText: widget.hint,
        hintStyle: context.typo.headline5.copyWith(
          fontWeight: context.typo.light,
          color: context.color.onHintContainer,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 11.5,
        ),
        suffixIcon: controller.text.isEmpty
            ? null
            : Button(
                onPressed: () {
                  controller.clear();
                  widget.onClear?.call();
                  setState(() {});
                },
                type: ButtonType.flat,
                icon: 'close',
              ),
      ),
    );
  }
}
