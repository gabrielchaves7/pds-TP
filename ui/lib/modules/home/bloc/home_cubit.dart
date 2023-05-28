import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';
import 'package:premium_todo/modules/home/home.dart';
import 'package:premium_todo/modules/home/repository/job.dart';
import 'package:premium_todo/modules/home/repository/jobs_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({JobsRepository? jobsRepository})
      : super(
          HomeState(
            filterQuery: FilterQuery(
              requiredExperienceFilter: RequiredExperienceFilter.ALL,
              salaryRangeFilter: SalaryRangeFilter.any,
              fullTimeFilter: true,
              interimFilter: true,
              partTimeFilter: true,
              datePostedFilter: DatePostedFilter.all,
              locationFilter: LocationFilter.near,
            ),
            jobs: [],
          ),
        ) {
    _jobsRepository = jobsRepository ?? getIt<JobsRepository>();
  }

  late JobsRepository _jobsRepository;

  Future<void> listJobs(int userId) async {
    final jobs = await _jobsRepository.get(userId);
    emit(state.copyWith(jobs: jobs));
  }

  void updateQuery({
    RequiredExperienceFilter? requiredExperienceFilter,
    SalaryRangeFilter? salaryRangeFilter,
    bool? fullTimeFilter,
    bool? interimFilter,
    bool? partTimeFilter,
    DatePostedFilter? datePostedFilter,
    LocationFilter? locationFilter,
  }) {
    emit(
      state.copyWith(
        filterQuery: FilterQuery(
          requiredExperienceFilter: requiredExperienceFilter ??
              state.filterQuery.requiredExperienceFilter,
          salaryRangeFilter:
              salaryRangeFilter ?? state.filterQuery.salaryRangeFilter,
          fullTimeFilter: fullTimeFilter ?? state.filterQuery.fullTimeFilter,
          interimFilter: interimFilter ?? state.filterQuery.interimFilter,
          partTimeFilter: partTimeFilter ?? state.filterQuery.partTimeFilter,
          datePostedFilter:
              datePostedFilter ?? state.filterQuery.datePostedFilter,
          locationFilter: locationFilter ?? state.filterQuery.locationFilter,
        ),
      ),
    );
  }

  void updateJobsList(Job newJob) {
    emit(state.copyWith(jobs: [...state.jobs, newJob]));
  }
}
