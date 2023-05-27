import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:premium_todo/modules/sign_up/repository/signup_repository.dart';
import 'package:premium_todo/modules/sign_up/repository/user.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required SignUpRepository signUpRepository})
      : _signUpRepository = signUpRepository,
        super(
          signUpRepository.currentUser.isNotEmpty
              ? AppState.authenticated(signUpRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _signUpRepository.userStream.listen(
      (user) => add(_AppUserChanged(user)),
    );
  }

  final SignUpRepository _signUpRepository;
  late final StreamSubscription<NUser> _userSubscription;

  void _onUserChanged(_AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_signUpRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
