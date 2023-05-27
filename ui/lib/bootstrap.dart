import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:premium_todo/firebase_options.dart';
import 'package:premium_todo/modules/app/view/app.dart';
import 'package:premium_todo/modules/http/http_provider.dart';
import 'package:premium_todo/modules/http/http_provider_impl.dart';
import 'package:premium_todo/modules/sign_up/repository/signup_repository.dart';

final getIt = GetIt.instance;

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> setup() async {
  getIt
    ..registerSingleton<IHttpProvider>(HttpProvider())
    ..registerLazySingleton<SignUpRepository>(SignUpRepository.new);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await setup();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  await runZonedGuarded(
    () async => runApp(App(authenticationRepository: authenticationRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
