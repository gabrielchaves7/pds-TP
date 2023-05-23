import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/organisms/serasa_page.dart';
import 'package:premium_todo/modules/app/routes/routes.dart';
import 'package:premium_todo/modules/sign_up/sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static MaterialPageRoute<void> pageRoute() => MaterialPageRoute<void>(
        builder: (context) => const SignUpPage(),
        settings: const RouteSettings(name: AppRoutes.SIGNUP_PAGE),
      );

  @override
  Widget build(BuildContext context) {
    return SerasaPage(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 548,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      fontSize: 44,
                      color: DsColors.brandColorPrimary,
                    ),
                    text: 'Faça parte',
                    children: <TextSpan>[
                      TextSpan(
                        text: ' da QuickJob',
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
                BlocProvider<SignUpCubit>(
                  create: (_) =>
                      SignUpCubit(context.read<AuthenticationRepository>()),
                  child: const SignUpForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
