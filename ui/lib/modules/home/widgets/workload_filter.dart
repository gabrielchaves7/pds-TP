import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';
import 'package:premium_todo/design_system/molecules/ds_checkbox_tile.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';

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
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return DsCheckboxTile(
              title: 'Full-time',
              value: state.filterQuery.fullTimeFilter,
              onChanged: (bool? value) =>
                  context.read<HomeCubit>().updateQuery(fullTimeFilter: value),
            );
          },
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return DsCheckboxTile(
              title: 'Temporário',
              value: state.filterQuery.interimFilter,
              onChanged: (bool? value) =>
                  context.read<HomeCubit>().updateQuery(interimFilter: value),
            );
          },
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return DsCheckboxTile(
              title: 'Meio período',
              value: state.filterQuery.partTimeFilter,
              onChanged: (bool? value) =>
                  context.read<HomeCubit>().updateQuery(partTimeFilter: value),
            );
          },
        ),
      ],
    );
  }
}
