import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/molecules/ds_checkbox_tile.dart';

class Workload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Text('Carga horária'),
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
