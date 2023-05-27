import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';

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
    return BlocBuilder<HomeCubit, HomeState>(
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
              groupValue: state.filterQuery.salaryRangeFilter,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<HomeCubit>().updateQuery(
                        salaryRangeFilter: value,
                      ),
            ),
            DsRadio(
              title: '> 30000',
              value: SalaryRangeFilter.thirty,
              groupValue: state.filterQuery.salaryRangeFilter,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<HomeCubit>().updateQuery(
                        salaryRangeFilter: value,
                      ),
            ),
            DsRadio(
              title: '> 50000',
              value: SalaryRangeFilter.fifty,
              groupValue: state.filterQuery.salaryRangeFilter,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<HomeCubit>().updateQuery(
                        salaryRangeFilter: value,
                      ),
            ),
            DsRadio(
              title: '> 80000',
              value: SalaryRangeFilter.eighty,
              groupValue: state.filterQuery.salaryRangeFilter,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<HomeCubit>().updateQuery(
                        salaryRangeFilter: value,
                      ),
            ),
            DsRadio(
              title: '> 100000',
              value: SalaryRangeFilter.oneHundred,
              groupValue: state.filterQuery.salaryRangeFilter,
              onChanged: (SalaryRangeFilter? value) =>
                  context.read<HomeCubit>().updateQuery(
                        salaryRangeFilter: value,
                      ),
            ),
          ],
        );
      },
    );
  }
}
