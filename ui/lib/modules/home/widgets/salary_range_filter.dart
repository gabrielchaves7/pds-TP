import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/modules/home/bloc/salary_range_filter_cubit.dart';

enum SalaryRangeFilter {
  any,
  thirty,
  fifty,
  eighty,
  oneHundred,
}

class Salary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalaryRangeFilterCubit, SalaryRangeFilter>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: DsSpacing.xs),
              child: Text(
                'Salário',
                style: DsTextStyles.filterTitle,
              ),
            ),
            DsRadio(
              title: 'Any',
              value: SalaryRangeFilter.any,
              groupValue: state,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<SalaryRangeFilterCubit>().update(value!),
            ),
            DsRadio(
              title: '> 30000',
              value: SalaryRangeFilter.thirty,
              groupValue: state,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<SalaryRangeFilterCubit>().update(value!),
            ),
            DsRadio(
              title: '> 50000',
              value: SalaryRangeFilter.fifty,
              groupValue: state,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<SalaryRangeFilterCubit>().update(value!),
            ),
            DsRadio(
              title: '> 80000',
              value: SalaryRangeFilter.eighty,
              groupValue: state,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<SalaryRangeFilterCubit>().update(value!),
            ),
            DsRadio(
              title: '> 100000',
              value: SalaryRangeFilter.oneHundred,
              groupValue: state,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<SalaryRangeFilterCubit>().update(value!),
            ),
          ],
        );
      },
    );
  }
}
