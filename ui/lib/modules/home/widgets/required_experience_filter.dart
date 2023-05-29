import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';

enum RequiredExperienceFilter {
  ALL,
  entryLevel,
  midSeniorLevel,
}

class RequiredExperience extends StatelessWidget {
  const RequiredExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
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
              value: RequiredExperienceFilter.ALL,
              groupValue: state.filterQuery.requiredExperienceFilter,
              onChanged: (RequiredExperienceFilter? value) => context
                  .read<HomeCubit>()
                  .updateQuery(requiredExperienceFilter: value),
            ),
            DsRadio<RequiredExperienceFilter>(
              title: 'Estágio',
              value: RequiredExperienceFilter.entryLevel,
              groupValue: state.filterQuery.requiredExperienceFilter,
              onChanged: (RequiredExperienceFilter? value) => context
                  .read<HomeCubit>()
                  .updateQuery(requiredExperienceFilter: value),
            ),
            DsRadio<RequiredExperienceFilter>(
              title: 'MID / SENIOR',
              value: RequiredExperienceFilter.midSeniorLevel,
              groupValue: state.filterQuery.requiredExperienceFilter,
              onChanged: (RequiredExperienceFilter? value) => context
                  .read<HomeCubit>()
                  .updateQuery(requiredExperienceFilter: value),
            ),
          ],
        );
      },
    );
  }
}
