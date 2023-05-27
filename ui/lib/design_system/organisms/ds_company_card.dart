import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:premium_todo/assets.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/molecules/ds_icon_and_title.dart';
import 'package:premium_todo/design_system/organisms/ds_file_picker_widget.dart';

class DsCompanyCard extends StatelessWidget {
  const DsCompanyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (builder) => Dialog(
            child: DsFilePicker(),
          ),
        );
      },
      child: Container(
        constraints: const BoxConstraints(maxWidth: 756),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: DsSpacing.xxx),
            child: ListTile(
              leading: Image.asset(
                Assets.assets_icon_png,
                width: 72,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Empresa 1',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 150,
                    child: DsOutlinedButton(
                      child: const Text('Candidatou-se'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              subtitle: Container(
                constraints: const BoxConstraints(maxWidth: 604),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Software Engineer',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: DsSpacing.x,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DsIconAndTitle(
                          icon: const Icon(Icons.location_on),
                          title: 'Contagem',
                        ),
                        DsIconAndTitle(
                          icon: const Icon(Icons.schedule),
                          title: 'Full time',
                        ),
                        DsIconAndTitle(
                          icon: const Icon(Icons.attach_money),
                          title: '30-32k',
                        ),
                        DsIconAndTitle(
                          icon: const Icon(Icons.calendar_month),
                          title: '1 dia atrás',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: DsSpacing.xx,
                    ),
                    const Text(
                      'Mollit in laborum tempor Lorem incididunt irure. Aute eu ex ad sunt. Pariatur sint culpa do incididunt eiusmod eiusmod culpa. laborum tempor Lorem incididunt.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
