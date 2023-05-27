import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/sign_up/repository/signup_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({SignUpRepository? signUpRepository})
      : super(const SignUpState()) {
    _signUpRepository = signUpRepository ?? getIt<SignUpRepository>();
  }

  late SignUpRepository _signUpRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.password,
          state.confirmedPassword,
          state.role,
        ]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.email,
          password,
          confirmedPassword,
          state.role,
        ]),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.email,
          state.password,
          confirmedPassword,
          state.role,
        ]),
      ),
    );
  }

  void roleChanged(String value) {
    final role = Role.dirty(value);
    emit(
      state.copyWith(
        role: role,
        isValid: Formz.validate([
          state.email,
          state.password,
          state.confirmedPassword,
          role,
        ]),
      ),
    );
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _signUpRepository.post(
        username: state.email.value,
        password: state.password.value,
        role: state.role.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
