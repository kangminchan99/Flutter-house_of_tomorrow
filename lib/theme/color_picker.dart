import 'package:flutter/material.dart';
import 'package:houseoftomorrow/src/service/theme_service.dart';

class ColorPicker extends StatelessWidget {
  final int colorIndex;
  final List<Color> colorsList;
  final void Function(int index) onColorSelected;
  const ColorPicker({
    super.key,
    required this.colorIndex,
    required this.colorsList,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.0,
      alignment: WrapAlignment.center,
      children: colorsList.asMap().entries.map((entry) {
        int idx = entry.key;
        Color color = entry.value;
        bool isSelected = idx == colorIndex;
        return GestureDetector(
          onTap: () => onColorSelected(idx),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: context.color.primary, width: 3)
                  : null,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(isSelected ? 1 : 4.0),
            child: DecoratedBox(
              decoration: BoxDecoration(boxShadow: context.deco.shadow),
              child: CircleAvatar(backgroundColor: color, radius: 20),
            ),
          ),
        );
      }).toList(),
    );
  }
}
