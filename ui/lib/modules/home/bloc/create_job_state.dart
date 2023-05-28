import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

class CreateJobState extends Equatable {
  const CreateJobState({
    this.jobForm = const JobForm(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  final JobForm jobForm;
  final bool isValid;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [jobForm];

  CreateJobState copyWith({
    Email? email,
    DefaultJobInput? name,
    DefaultJobInput? location,
    JobMinSalary? minSalary,
    JobMaxSalary? maxSalary,
    DefaultJobInput? phone,
    DefaultJobInput? description,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return CreateJobState(
      jobForm: JobForm(
        email: email ?? jobForm.email,
        name: name ?? jobForm.name,
        location: location ?? jobForm.location,
        minSalary: minSalary ?? jobForm.minSalary,
        maxSalary: maxSalary ?? jobForm.maxSalary,
        phone: phone ?? jobForm.phone,
        description: description ?? jobForm.description,
      ),
      isValid: jobForm.isValid,
      status: status ?? this.status,
    );
  }
}
