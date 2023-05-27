import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/organisms/serasa_page.dart';
import 'package:premium_todo/modules/app/app.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';
import 'package:premium_todo/modules/home/view/jobs_list.dart';
import 'package:premium_todo/modules/home/widgets/widgets.dart';
import 'package:premium_todo/modules/sign_up/repository/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());
  static MaterialPageRoute<void> pageRoute() => MaterialPageRoute<void>(
        builder: (context) => const HomePage(),
        settings: const RouteSettings(name: AppRoutes.HOME_PAGE),
      );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeCubit>().listJobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SerasaPage(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w400,
                      fontSize: 44,
                      color: Colors.black,
                    ),
                    text: _getMainText(state),
                    children: <TextSpan>[
                      TextSpan(
                        text: _getHighlightText(state),
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w600,
                          fontSize: 44,
                          color: DsColors.brandColorPrimary,
                        ),
                      ),
                      const TextSpan(
                        text: ' hoje',
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 44,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Text('''
      Milhares de empregos para jovens da ciência de computação, sistemas de informação, e outros setores estão esperando por você.'''),
            const SizedBox(height: 8),
            Row(
              children: [
                const DSTextField(
                  label: 'Pesquisar',
                  hintText: 'Qual vaga você está procurando?',
                  prefixIcon: Icon(Icons.search),
                ),
                const DSTextField(
                  label: 'Localização',
                  prefixIcon: Icon(Icons.location_on),
                ),
                Expanded(
                  child: DsOutlinedButton(
                    child: const Text('Procurar'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            Wrap(
              children: [
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(DsSpacing.xxx),
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Filtros',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: DsSpacing.xx,
                          ),
                          LocationFilterWidget(),
                          const SizedBox(
                            height: DsSpacing.xx,
                          ),
                          Salary(),
                          const SizedBox(
                            height: DsSpacing.xx,
                          ),
                          DatePosted(),
                          const SizedBox(
                            height: DsSpacing.xx,
                          ),
                          RequiredExperience(),
                          const SizedBox(
                            height: DsSpacing.xx,
                          ),
                          Workload(),
                        ],
                      ),
                    ),
                  ),
                ),
                const JobsLits(),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getMainText(AppState state) {
    if (state.user.role == UserRole.APPLICANT) {
      return 'Encontre a sua';
    } else if (state.user.role == UserRole.COMPANY) {
      return 'Encontre o seu ';
    }

    return '';
  }

  String _getHighlightText(AppState state) {
    if (state.user.role == UserRole.APPLICANT) {
      return 'vaga';
    } else if (state.user.role == UserRole.COMPANY) {
      return 'candidato';
    }

    return '';
  }
}
