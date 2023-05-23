import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/organisms/serasa_page.dart';
import 'package:premium_todo/modules/app/app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());
  static MaterialPageRoute<void> pageRoute() => MaterialPageRoute<void>(
        builder: (context) => const HomePage(),
        settings: const RouteSettings(name: AppRoutes.HOME_PAGE),
      );

  @override
  Widget build(BuildContext context) {
    return SerasaPage(
      body: Column(
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
          SizedBox(height: 4),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
