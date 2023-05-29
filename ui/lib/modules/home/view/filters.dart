import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/spacing.dart';
import 'package:premium_todo/modules/home/widgets/date_posted_filter.dart';
import 'package:premium_todo/modules/home/widgets/location_filter.dart';
import 'package:premium_todo/modules/home/widgets/required_experience_filter.dart';
import 'package:premium_todo/modules/home/widgets/salary_range_filter.dart';
import 'package:premium_todo/modules/home/widgets/workload_filter.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(DsSpacing.xxx),
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filtros',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: DsSpacing.xx,
              ),
              LocationFilterWidget(),
              SizedBox(
                height: DsSpacing.xx,
              ),
              Salary(),
              SizedBox(
                height: DsSpacing.xx,
              ),
              DatePosted(),
              SizedBox(
                height: DsSpacing.xx,
              ),
              RequiredExperience(),
              SizedBox(
                height: DsSpacing.xx,
              ),
              Workload(),
            ],
          ),
        ),
      ),
    );
  }
}
