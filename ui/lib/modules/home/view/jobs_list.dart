// ignore_for_file: parameter_assignments

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/organisms/ds_job_card.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';
import 'package:premium_todo/modules/home/home.dart';
import 'package:premium_todo/modules/home/repository/job.dart';

class JobsLits extends StatelessWidget {
  const JobsLits({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.jobs.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Wrap(
            children: _applyFilterQuery(state.jobs, state.filterQuery)
                .map(
                  (e) => DsJobCard(
                    job: e,
                  ),
                )
                .toList(),
          );
        }
      },
    );
  }

  List<Job> _applyDatePostedFilter(List<Job> jobs, DatePostedFilter filter) {
    late final int hours;

    if (filter != DatePostedFilter.all) {
      if (filter == DatePostedFilter.last24h) {
        hours = 24;
      } else if (filter == DatePostedFilter.last3days) {
        hours = 72;
      } else if (filter == DatePostedFilter.last7days) {
        hours = 168;
      }

      jobs = jobs
          .where(
            (element) =>
                element.date != null &&
                DateTime.now().difference(element.date!).inHours < hours,
          )
          .toList();
    }

    return jobs;
  }

  List<Job> _applyFilterQuery(List<Job> jobs, FilterQuery query) {
    jobs = _applyRequiredExperienceFilter(jobs, query.requiredExperienceFilter);
    jobs = _applySalaryRangefilter(jobs, query.salaryRangeFilter);
    jobs = _applyDatePostedFilter(jobs, query.datePostedFilter);

    return jobs;
  }

  List<Job> _applyRequiredExperienceFilter(
    List<Job> jobs,
    RequiredExperienceFilter filter,
  ) {
    if (filter != RequiredExperienceFilter.ALL) {
      jobs = jobs.where((element) => element.experience == filter).toList();
    }

    return jobs;
  }

  List<Job> _applySalaryRangefilter(List<Job> jobs, SalaryRangeFilter filter) {
    if (filter != SalaryRangeFilter.any) {
      var limit = 0.0;
      if (filter == SalaryRangeFilter.thirty) {
        limit = 30.000;
      } else if (filter == SalaryRangeFilter.fifty) {
        limit = 50.000;
      } else if (filter == SalaryRangeFilter.eighty) {
        limit = 80.000;
      } else if (filter == SalaryRangeFilter.oneHundred) {
        limit = 100.000;
      }
      jobs = jobs.where((element) => element.maxSalary > limit).toList();
    }

    return jobs;
  }
}
