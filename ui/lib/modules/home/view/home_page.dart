import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/organisms/ds_job_card.dart';
import 'package:premium_todo/design_system/organisms/serasa_page.dart';
import 'package:premium_todo/modules/app/app.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';
import 'package:premium_todo/modules/home/bloc/home_state.dart';
import 'package:premium_todo/modules/home/repository/job.dart';
import 'package:premium_todo/modules/home/widgets/widgets.dart';

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
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w400,
                  fontSize: 44,
                  color: Colors.black,
                ),
                text: 'Encontre a sua ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'vaga',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      fontSize: 44,
                      color: DsColors.brandColorPrimary,
                    ),
                  ),
                  TextSpan(
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
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state.jobs.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Wrap(
                        children:
                            _applyFilterQuery(state.jobs, state.filterQuery)
                                .map(
                                  (e) => DsJobCard(
                                    job: e,
                                  ),
                                )
                                .toList(),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Job> _applyFilterQuery(List<Job> jobs, FilterQuery query) {
    jobs = _applyRequiredExperienceFilter(jobs, query.requiredExperienceFilter);
    jobs = _applySalaryRangefilter(jobs, query.salaryRangeFilter);

    return jobs;
  }

  List<Job> _applyRequiredExperienceFilter(
      List<Job> jobs, RequiredExperienceFilter filter) {
    if (filter != RequiredExperienceFilter.all) {
      jobs = jobs.where((element) => element.experience == filter).toList();
    }

    return jobs;
  }

  List<Job> _applySalaryRangefilter(List<Job> jobs, SalaryRangeFilter filter) {
    if (filter != SalaryRangeFilter.any) {
      double limit = 0;
      if (filter == SalaryRangeFilter.thirty) {
        limit = 30.000;
      } else if (filter == SalaryRangeFilter.fifty) {
        limit = 50.000;
      } else if (filter == SalaryRangeFilter.eighty) {
        limit = 80.000;
      } else if (filter == SalaryRangeFilter.oneHundred) {
        limit = 100.000;
      }
      jobs = jobs.where((element) => element.maxSalary > limit).toList();
    }

    return jobs;
  }
}
