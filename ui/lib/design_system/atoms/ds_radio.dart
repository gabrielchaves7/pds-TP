import 'package:flutter/material.dart';

/// Widget that loads an checkbox.
class DsRadio<T> extends StatelessWidget {
  ///Creates an DsRadio
  const DsRadio({
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
    super.key,
  });

  final String title;
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(Object context) {
    return Row(
      children: [
        Radio<T>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title)
      ],
    );
  }
}
