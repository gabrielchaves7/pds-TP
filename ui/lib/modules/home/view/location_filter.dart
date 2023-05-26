import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';

enum LocationFilter {
  near,
  homeOffice,
}

class LocationFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Text('Localização'),
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
