import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/assets.dart';
import 'package:premium_todo/design_system/atoms/ds_radio.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/molecules/ds_icon_and_title.dart';
import 'package:premium_todo/design_system/organisms/ds_company_card.dart';
import 'package:premium_todo/design_system/organisms/serasa_page.dart';
import 'package:premium_todo/modules/app/app.dart';
import 'package:premium_todo/modules/app/bloc/user_role_bloc.dart';
import 'package:premium_todo/modules/home/view/date_posted_filter.dart';
import 'package:premium_todo/modules/home/view/location_filter.dart';
import 'package:premium_todo/modules/home/view/required_experience_filter.dart';
import 'package:premium_todo/modules/home/view/salary_range_filter.dart';
import 'package:premium_todo/modules/home/view/workload_filter.dart';

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
    context.read<UserRoleCubit>().getUserRole();
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
                SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Filtros'),
                      LocationFilterWidget(),
                      Salary(),
                      DatePosted(),
                      RequiredExperience(),
                      Workload(),
                    ],
                  ),
                ),
                DsCompanyCard()
              ],
            )
          ],
        ),
      ),
    );
  }
}
