import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';
import 'package:premium_todo/design_system/molecules/ds_checkbox_tile.dart';

class Workload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: DsSpacing.xs),
          child: Text(
            'Carga horária',
            style: DsTextStyles.filterTitle,
          ),
        ),
        DsCheckboxTile(
          title: 'Full-time',
          value: true,
          onChanged: (bool? value) {},
        ),
        DsCheckboxTile(
          title: 'Temporário',
          value: true,
          onChanged: (bool? value) {},
        ),
        DsCheckboxTile(
          title: 'Meio período',
          value: true,
          onChanged: (bool? value) {},
        ),
      ],
    );
  }
}
