import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:premium_todo/assets.dart';
import 'package:premium_todo/design_system/design_system.dart';

class DsFilePicker extends StatefulWidget {
  const DsFilePicker({super.key});

  @override
  State<DsFilePicker> createState() => _DsFilePickerState();
}

class _DsFilePickerState extends State<DsFilePicker> {
  FilePickerResult? filePickerResult;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );

        setState(() {
          filePickerResult = result;
        });
      },
      child: Padding(
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
              Expanded(
                child: DottedBorder(
                  strokeWidth: 4,
                  dashPattern: [12, 8],
                  color: DsColors.brandColorPrimary,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.assets_upload_png,
                          width: 72,
                        ),
                        const Text(
                          'Faça upload do seu arquivo',
                          style: TextStyle(fontSize: 48),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (filePickerResult != null)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color(0xFFE9F0FE),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DsSpacing.xxxx,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            filePickerResult!.files.first.name,
                            style: const TextStyle(
                              fontSize: 36,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                filePickerResult = null;
                              });
                            },
                            child: const Icon(
                              Icons.delete,
                              size: 44,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
