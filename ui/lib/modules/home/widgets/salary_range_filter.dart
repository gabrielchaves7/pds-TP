import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/design_system.dart';

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
          groupValue: SalaryRangeFilter.any,
          onChanged: (SalaryRangeFilter? value) {},
        ),
        DsRadio(
          title: '> 30000',
          value: SalaryRangeFilter.thirty,
          groupValue: SalaryRangeFilter.any,
          onChanged: (SalaryRangeFilter? value) {},
        ),
        DsRadio(
          title: '> 50000',
          value: SalaryRangeFilter.fifty,
          groupValue: SalaryRangeFilter.any,
          onChanged: (SalaryRangeFilter? value) {},
        ),
        DsRadio(
          title: '> 80000',
          value: SalaryRangeFilter.eighty,
          groupValue: SalaryRangeFilter.any,
          onChanged: (SalaryRangeFilter? value) {},
        ),
        DsRadio(
          title: '> 100000',
          value: SalaryRangeFilter.oneHundred,
          groupValue: SalaryRangeFilter.any,
          onChanged: (SalaryRangeFilter? value) {},
        ),
      ],
    );
  }
}
