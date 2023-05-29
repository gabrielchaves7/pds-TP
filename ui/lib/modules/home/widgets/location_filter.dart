import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';

enum LocationFilter {
  near,
  homeOffice,
}

class LocationFilterWidget extends StatelessWidget {
  const LocationFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (BuildContext context, state) {
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
              groupValue: state.filterQuery.locationFilter,
              onChanged: (LocationFilter? value) =>
                  context.read<HomeCubit>().updateQuery(locationFilter: value),
            ),
            DsRadio<LocationFilter>(
              title: 'Remoto',
              value: LocationFilter.homeOffice,
              groupValue: state.filterQuery.locationFilter,
              onChanged: (LocationFilter? value) =>
                  context.read<HomeCubit>().updateQuery(locationFilter: value),
            ),
          ],
        );
      },
    );
  }
}
