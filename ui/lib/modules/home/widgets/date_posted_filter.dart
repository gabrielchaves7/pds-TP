import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/design_system/atoms/text_styles.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';

enum DatePostedFilter {
  all,
  last24h,
  last3days,
  last7days,
}

class DatePosted extends StatelessWidget {
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
                'Data da postgem',
                style: DsTextStyles.filterTitle,
              ),
            ),
            DsRadio<DatePostedFilter>(
              title: 'Todas',
              value: DatePostedFilter.all,
              groupValue: state.filterQuery.datePostedFilter,
              onChanged: (DatePostedFilter? value) => context
                  .read<HomeCubit>()
                  .updateQuery(datePostedFilter: value),
            ),
            DsRadio<DatePostedFilter>(
              title: '24h',
              value: DatePostedFilter.last24h,
              groupValue: state.filterQuery.datePostedFilter,
              onChanged: (DatePostedFilter? value) => context
                  .read<HomeCubit>()
                  .updateQuery(datePostedFilter: value),
            ),
            DsRadio<DatePostedFilter>(
              title: '3 dias',
              value: DatePostedFilter.last3days,
              groupValue: state.filterQuery.datePostedFilter,
              onChanged: (DatePostedFilter? value) => context
                  .read<HomeCubit>()
                  .updateQuery(datePostedFilter: value),
            ),
            DsRadio<DatePostedFilter>(
              title: '7 dias',
              value: DatePostedFilter.last7days,
              groupValue: state.filterQuery.datePostedFilter,
              onChanged: (DatePostedFilter? value) => context
                  .read<HomeCubit>()
                  .updateQuery(datePostedFilter: value),
            ),
          ],
        );
      },
    );
  }
}
