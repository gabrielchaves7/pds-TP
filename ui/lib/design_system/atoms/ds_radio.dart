import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/design_system.dart';

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
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Row(
        children: [
          Radio<T>(
            activeColor: const Color(0xFF3575E2),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          const SizedBox(
            width: DsSpacing.x,
          ),
          Text(
            title,
            style: DsTextStyles.filterText,
          )
        ],
      ),
    );
  }
}
