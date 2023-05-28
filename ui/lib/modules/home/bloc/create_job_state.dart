import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';

class CreateJobState extends Equatable {
  const CreateJobState({this.jobForm = const JobForm()});

  final JobForm jobForm;

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
    );
  }
}
