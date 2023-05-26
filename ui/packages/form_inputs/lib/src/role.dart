import 'package:formz/formz.dart';

enum RoleValidationError { invalid }

class Role extends FormzInput<String, RoleValidationError> {
  const Role.pure() : super.pure('APPLICANT');

  const Role.dirty([super.value = '']) : super.dirty();

  @override
  RoleValidationError? validator(String value) {
    return value.isNotEmpty ? null : RoleValidationError.invalid;
  }
}
