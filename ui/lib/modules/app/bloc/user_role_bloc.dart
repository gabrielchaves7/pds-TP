import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A `UserRoleCubit` which manages an `int` as its state.
class UserRoleCubit extends Cubit<UserRole?> {
  /// The initial state of the `UserRoleCubit` is 0.
  UserRoleCubit({required this.authenticationRepository}) : super(null);

  final AuthenticationRepository authenticationRepository;

  Future<void> getUserRole() async {
    final roleString = await authenticationRepository.getUserRole();

    UserRole? role;
    if (roleString == UserRole.COMPANY.name) {
      role = UserRole.COMPANY;
    } else if (roleString == UserRole.APPLICANT.name) {
      role = UserRole.APPLICANT;
    }

    emit(role);
  }
}
