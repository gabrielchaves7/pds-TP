import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';
import 'package:premium_todo/modules/home/home.dart';
import 'package:premium_todo/modules/home/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({HomeRepository? homeRepository})
      : super(
          HomeState(
            filterQuery: FilterQuery(
              requiredExperienceFilter: RequiredExperienceFilter.all,
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
    _homeRepository = homeRepository ?? getIt<HomeRepository>();
  }

  late HomeRepository _homeRepository;

  Future<void> listJobs() async {
    final jobs = await _homeRepository.get();
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
}