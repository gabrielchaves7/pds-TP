import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';

enum DatePostedFilter {
  all,
  last24h,
  last3days,
  last7days,
}

class DatePosted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Text('Data da postgem'),
        DsRadio<DatePostedFilter>(
          title: 'Todas',
          value: DatePostedFilter.all,
          groupValue: DatePostedFilter.all,
          onChanged: (DatePostedFilter? value) {},
        ),
        DsRadio<DatePostedFilter>(
          title: '24h',
          value: DatePostedFilter.last24h,
          groupValue: DatePostedFilter.all,
          onChanged: (DatePostedFilter? value) {},
        ),
        DsRadio<DatePostedFilter>(
          title: '3 dias',
          value: DatePostedFilter.last3days,
          groupValue: DatePostedFilter.all,
          onChanged: (DatePostedFilter? value) {},
        ),
        DsRadio<DatePostedFilter>(
          title: '7 dias',
          value: DatePostedFilter.last7days,
          groupValue: DatePostedFilter.all,
          onChanged: (DatePostedFilter? value) {},
        ),
      ],
    );
  }
}
