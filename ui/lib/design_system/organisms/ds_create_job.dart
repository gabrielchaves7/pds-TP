import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:premium_todo/assets.dart';
import 'package:premium_todo/design_system/design_system.dart';

class DsCreateJob extends StatefulWidget {
  const DsCreateJob({super.key});

  @override
  State<DsCreateJob> createState() => _DsCreateJobState();
}

class _DsCreateJobState extends State<DsCreateJob> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DsSpacing.xxxxs),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 400,
          maxWidth: 600,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w400,
                  fontSize: 44,
                  color: Colors.black,
                ),
                text: 'Crie sua ',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
