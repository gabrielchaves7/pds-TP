import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/molecules/ds_icon_and_title.dart';
import 'package:premium_todo/design_system/organisms/ds_file_picker_widget.dart';
import 'package:premium_todo/modules/home/repository/job.dart';

class DsJobCard extends StatelessWidget {
  const DsJobCard({required this.job, super.key});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (builder) => const Dialog(
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
              leading: Image.network(
                job.imageUrl!,
                width: 72,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    job.companyName ?? 'Nome indisponível',
                    style: const TextStyle(fontSize: 18),
                  ),
                  // SizedBox(
                  //   width: 150,
                  //   child: DsOutlinedButton(
                  //     child: const Text('Candidatou-se'),
                  //     onPressed: () {},
                  //   ),
                  // )
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
                    Text(
                      job.name,
                      style: const TextStyle(
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
                          title: job.location,
                        ),
                        DsIconAndTitle(
                          icon: const Icon(Icons.schedule),
                          title: 'Full time',
                        ),
                        DsIconAndTitle(
                          icon: const Icon(Icons.attach_money),
                          title: '${job.minSalary}-${job.maxSalary}',
                        ),
                        DsIconAndTitle(
                          icon: const Icon(Icons.calendar_month),
                          title: job.date != null
                              ? '''
${DateTime.now().difference(job.date!).inHours}h atrás'''
                              : 'Data indisponível',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: DsSpacing.xx,
                    ),
                    Text(job.description),
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
