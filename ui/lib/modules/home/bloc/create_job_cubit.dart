import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/home/bloc/create_job_state.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';
import 'package:premium_todo/modules/home/home.dart';
import 'package:premium_todo/modules/home/repository/home_repository.dart';

class CreateJobCubit extends Cubit<CreateJobState> {
  CreateJobCubit({HomeRepository? homeRepository})
      : super(const CreateJobState()) {
    _homeRepository = homeRepository ?? getIt<HomeRepository>();
  }

  late HomeRepository _homeRepository;

  void updateForm({
    Email? email,
    DefaultJobInput? name,
    DefaultJobInput? location,
    JobMinSalary? minSalary,
    JobMaxSalary? maxSalary,
    DefaultJobInput? phone,
    DefaultJobInput? description,
  }) {
    emit(
      state.copyWith(
        email: email,
        name: name,
        location: location,
        minSalary: minSalary,
        maxSalary: maxSalary,
        phone: phone,
        description: description,
      ),
    );
  }
}
