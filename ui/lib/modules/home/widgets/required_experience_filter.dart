import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';
import 'package:premium_todo/modules/home/bloc/required_experience_filter.dart';

enum RequiredExperienceFilter {
  all,
  entryLevel,
  midSeniorLevel,
}

class RequiredExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequiredExperienceFilterCubit, RequiredExperienceFilter>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
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
              groupValue: state,
              onChanged: (RequiredExperienceFilter? value) =>
                  context.read<RequiredExperienceFilterCubit>().update(value!),
            ),
            DsRadio<RequiredExperienceFilter>(
              title: 'Estágio',
              value: RequiredExperienceFilter.entryLevel,
              groupValue: state,
              onChanged: (RequiredExperienceFilter? value) =>
                  context.read<RequiredExperienceFilterCubit>().update(value!),
            ),
            DsRadio<RequiredExperienceFilter>(
              title: 'MID / SENIOR',
              value: RequiredExperienceFilter.midSeniorLevel,
              groupValue: state,
              onChanged: (RequiredExperienceFilter? value) =>
                  context.read<RequiredExperienceFilterCubit>().update(value!),
            ),
          ],
        );
      },
    );
  }
}
