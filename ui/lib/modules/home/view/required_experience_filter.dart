import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';

enum RequiredExperienceFilter {
  all,
  entryLevel,
  midSeniorLevel,
}

class RequiredExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Text('Experiência exigida'),
        DsRadio<RequiredExperienceFilter>(
          title: 'Qualquer experiência',
          value: RequiredExperienceFilter.all,
          groupValue: RequiredExperienceFilter.all,
          onChanged: (RequiredExperienceFilter? value) {},
        ),
        DsRadio<RequiredExperienceFilter>(
          title: 'Estágio',
          value: RequiredExperienceFilter.entryLevel,
          groupValue: RequiredExperienceFilter.all,
          onChanged: (RequiredExperienceFilter? value) {},
        ),
        DsRadio<RequiredExperienceFilter>(
          title: 'MID / SENIOR',
          value: RequiredExperienceFilter.midSeniorLevel,
          groupValue: RequiredExperienceFilter.all,
          onChanged: (RequiredExperienceFilter? value) {},
        ),
      ],
    );
  }
}
