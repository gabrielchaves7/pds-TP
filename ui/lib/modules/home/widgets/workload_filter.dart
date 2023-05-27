import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';
import 'package:premium_todo/design_system/molecules/ds_checkbox_tile.dart';
import 'package:premium_todo/modules/home/bloc/workload_filter_cubit.dart';

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
        BlocBuilder<FulltimeFilterCubit, bool>(
          builder: (context, state) {
            return DsCheckboxTile(
              title: 'Full-time',
              value: state,
              onChanged: (bool? value) =>
                  context.read<FulltimeFilterCubit>().update(value!),
            );
          },
        ),
        BlocBuilder<InterimFilterCubit, bool>(
          builder: (context, state) {
            return DsCheckboxTile(
              title: 'Temporário',
              value: state,
              onChanged: (bool? value) =>
                  context.read<InterimFilterCubit>().update(value!),
            );
          },
        ),
        BlocBuilder<PartTimeFilterCubit, bool>(
          builder: (context, state) {
            return DsCheckboxTile(
              title: 'Meio período',
              value: state,
              onChanged: (bool? value) =>
                  context.read<PartTimeFilterCubit>().update(value!),
            );
          },
        ),
      ],
    );
  }
}
