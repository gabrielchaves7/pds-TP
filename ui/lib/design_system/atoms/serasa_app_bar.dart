import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/atoms/serasa_logo.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/modules/app/app.dart';
import 'package:premium_todo/modules/home/home.dart';
import 'package:premium_todo/modules/login/view/login_page.dart';
import 'package:premium_todo/modules/sign_up/repository/user.dart';

/// AppBar with logo
class SerasaAppBar extends StatelessWidget {
  ///
  const SerasaAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: DsColors.background,
      title: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          Widget widget = const SizedBox();
          if (ModalRoute.of(context)?.settings.name == AppRoutes.HOME_PAGE ||
              state.status == AppStatus.authenticated) {
            widget = getTitle(context, state);
          }
          return widget;
        },
      ),
      centerTitle: true,
      leading: const Padding(
        padding: EdgeInsets.only(left: 64),
        child: SerasaLogo(),
      ),
      leadingWidth: 200,
      actions: getActions(context),
    );
  }

  Widget getTitle(BuildContext context, AppState state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (state.user.role == UserRole.COMPANY)
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Criar vagas',
              style: TextStyle(color: Colors.black),
            ),
          )
        else
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Procurar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            state.status == AppStatus.authenticated
                ? Navigator.push(
                    context,
                    HomePage.pageRoute(),
                  )
                : Navigator.push(
                    context,
                    LoginPage.pageRoute(),
                  );
          },
          child: const Text(
            'Minhas vagas',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  List<Widget> getActions(BuildContext context) {
    final state = BlocProvider.of<AppBloc>(context).state;
    final actions = <Widget>[];
    if (state.status != AppStatus.authenticated &&
        ![AppRoutes.LOGIN_PAGE, AppRoutes.SIGNUP_PAGE, null]
            .contains(ModalRoute.of(context)?.settings.name)) {
      actions.addAll(
        [
          SizedBox(
            width: 84,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DsOutlinedButton(
                onPressed: () {},
                buttonType: DsOutlinedButtonType.secondary,
                child: const Text('Entrar'),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 120,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DsOutlinedButton(
                onPressed: () {},
                buttonType: DsOutlinedButtonType.secondary,
                child: const Text('Criar conta'),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      );
    } else if (state.status == AppStatus.authenticated) {
      actions.add(
        IconButton(
          key: const Key('homePage_logout_iconButton'),
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            context.read<AppBloc>().add(const AppLogoutRequested());
          },
        ),
      );
    }

    return actions;
  }
}
