import 'package:equatable/equatable.dart';
import 'package:premium_todo/modules/home/repository/job.dart';
import 'package:premium_todo/modules/home/widgets/date_posted_filter.dart';
import 'package:premium_todo/modules/home/widgets/location_filter.dart';
import 'package:premium_todo/modules/home/widgets/required_experience_filter.dart';
import 'package:premium_todo/modules/home/widgets/salary_range_filter.dart';

class FilterQuery {
  final RequiredExperienceFilter requiredExperienceFilter;
  final SalaryRangeFilter salaryRangeFilter;
  final bool fullTimeFilter;
  final bool interimFilter;
  final bool partTimeFilter;
  final DatePostedFilter datePostedFilter;
  final LocationFilter locationFilter;

  FilterQuery({
    required this.requiredExperienceFilter,
    required this.salaryRangeFilter,
    required this.fullTimeFilter,
    required this.interimFilter,
    required this.partTimeFilter,
    required this.datePostedFilter,
    required this.locationFilter,
  });
}

class HomeState extends Equatable {
  const HomeState({
    required this.filterQuery,
    required this.jobs,
  });

  final FilterQuery filterQuery;
  final List<Job> jobs;

  @override
  List<Object?> get props => [
        filterQuery,
        jobs,
      ];

  HomeState copyWith({
    FilterQuery? filterQuery,
    List<Job>? jobs,
  }) {
    return HomeState(
      filterQuery: filterQuery ?? this.filterQuery,
      jobs: jobs ?? this.jobs,
    );
  }
}
