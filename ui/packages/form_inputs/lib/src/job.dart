import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

enum DefaultJobInputValidationError { invalid }

enum JobMinSalaryValidationError { invalid }

enum JobMaxSalaryValidationError { invalid }

class DefaultJobInput
    extends FormzInput<String, DefaultJobInputValidationError> {
  const DefaultJobInput.pure() : super.pure('');
  const DefaultJobInput.dirty([super.value = '']) : super.dirty();

  @override
  DefaultJobInputValidationError? validator(String? value) {
    DefaultJobInputValidationError? error;
    if (value == null || value.isEmpty)
      error = DefaultJobInputValidationError.invalid;

    return error;
  }
}

class JobMinSalary extends FormzInput<double, JobMinSalaryValidationError> {
  const JobMinSalary.pure() : super.pure(0);
  const JobMinSalary.dirty([super.value = 0]) : super.dirty();

  @override
  JobMinSalaryValidationError? validator(double? value) {
    JobMinSalaryValidationError? error;
    if (value == null || value <= 0)
      error = JobMinSalaryValidationError.invalid;

    return error;
  }
}

class JobMaxSalary extends FormzInput<double, JobMaxSalaryValidationError> {
  const JobMaxSalary.pure() : super.pure(0);
  const JobMaxSalary.dirty([super.value = 0]) : super.dirty();

  @override
  JobMaxSalaryValidationError? validator(double? value) {
    JobMaxSalaryValidationError? error;
    if (value == null || value <= 0)
      error = JobMaxSalaryValidationError.invalid;

    return error;
  }
}

class JobForm with FormzMixin {
  const JobForm({
    this.email = const Email.pure(),
    this.name = const DefaultJobInput.pure(),
    this.location = const DefaultJobInput.pure(),
    this.minSalary = const JobMinSalary.pure(),
    this.maxSalary = const JobMaxSalary.pure(),
    this.phone = const DefaultJobInput.pure(),
    this.description = const DefaultJobInput.pure(),
  });

  final Email email;
  final DefaultJobInput name;
  final DefaultJobInput location;
  final JobMinSalary minSalary;
  final JobMaxSalary maxSalary;
  final DefaultJobInput phone;
  final DefaultJobInput description;

  @override
  List<FormzInput> get inputs => [
        email,
        name,
        location,
        minSalary,
        maxSalary,
        phone,
        description,
      ];
}
