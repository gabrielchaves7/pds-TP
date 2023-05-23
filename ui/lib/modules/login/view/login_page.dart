import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/organisms/serasa_page.dart';
import 'package:premium_todo/modules/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return SerasaPage(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 548,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      fontSize: 44,
                      color: DsColors.brandColorPrimary,
                    ),
                    text: 'Bem vindo',
                    children: <TextSpan>[
                      TextSpan(
                        text: ' de volta',
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 44,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text('''
Enim tempor eget pharetra facilisis sed maecenas adipiscing. Eu leo molestie vel, ornare non id blandit netus.'''),
                BlocProvider(
                  create: (_) =>
                      LoginCubit(context.read<AuthenticationRepository>()),
                  child: const LoginForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
