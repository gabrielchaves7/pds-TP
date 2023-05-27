import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';

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
        Padding(
          padding: const EdgeInsets.only(bottom: DsSpacing.xs),
          child: Text(
            'Experiência exigida',
            style: DsTextStyles.filterTitle,
          ),
        ),
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
