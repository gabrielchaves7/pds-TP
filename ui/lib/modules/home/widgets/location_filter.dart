import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';

enum LocationFilter {
  near,
  homeOffice,
}

class LocationFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: DsSpacing.xs),
          child: Text(
            'Localização',
            style: DsTextStyles.filterTitle,
          ),
        ),
        DsRadio<LocationFilter>(
          title: 'Perto de mim',
          value: LocationFilter.near,
          groupValue: LocationFilter.near,
          onChanged: (LocationFilter? value) {},
        ),
        DsRadio<LocationFilter>(
          title: 'Remoto',
          value: LocationFilter.homeOffice,
          groupValue: LocationFilter.near,
          onChanged: (LocationFilter? value) {},
        ),
      ],
    );
  }
}
