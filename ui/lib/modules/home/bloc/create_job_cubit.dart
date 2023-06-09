import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/home/bloc/create_job_state.dart';
import 'package:premium_todo/modules/home/home.dart';
import 'package:premium_todo/modules/home/repository/job.dart';
import 'package:premium_todo/modules/home/repository/jobs_repository.dart';
import 'package:uuid/uuid.dart';

class CreateJobCubit extends Cubit<CreateJobState> {
  CreateJobCubit({JobsRepository? jobRsepository})
      : super(const CreateJobState()) {
    _jobsRepository = jobRsepository ?? getIt<JobsRepository>();
  }

  late JobsRepository _jobsRepository;

  void updateForm({
    Email? email,
    DefaultJobInput? name,
    DefaultJobInput? location,
    JobMinSalary? minSalary,
    JobMaxSalary? maxSalary,
    DefaultJobInput? phone,
    DefaultJobInput? description,
    DefaultJobInput? experience,
    bool? allowFullTime,
    bool? allowInterim,
    bool? allowPartTime,
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
        experience: experience,
        allowFullTime: allowFullTime,
        allowInterim: allowInterim,
        allowPartTime: allowPartTime,
      ),
    );
  }

  Future<void> createJob({
    required Uint8List rawPath,
    required void Function(Job newJob) onJobCreated,
    required int companyId,
  }) async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      final newJob = await _jobsRepository.post(
        Job(
          contactPhone: state.jobForm.phone.value,
          description: state.jobForm.description.value,
          email: state.jobForm.email.value,
          experience: RequiredExperienceFilter.values
              .byName(state.jobForm.experience.value),
          location: state.jobForm.location.value,
          maxSalary: state.jobForm.maxSalary.value,
          minSalary: state.jobForm.minSalary.value,
          name: state.jobForm.name.value,
          companyId: companyId,
          imageUrl: await createImageDownloadUrl(rawPath),
          allowFullTime: state.jobForm.allowFullTime,
          allowInterim: state.jobForm.allowInterim,
          allowPartTime: state.jobForm.allowPartTime,
        ),
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      if (newJob != null) onJobCreated(newJob);
    } catch (e) {
      print(e);
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<String> createImageDownloadUrl(Uint8List rawPath) async {
    final storageRef = FirebaseStorage.instance.ref();
    final jobRef = storageRef.child('${const Uuid().v4()}.png');
    await jobRef.putData(rawPath);

    return jobRef.getDownloadURL();
  }
}
