import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:premium_todo/assets.dart';
import 'package:premium_todo/design_system/design_system.dart';

class DsImagePicker extends StatefulWidget {
  DsImagePicker(
      {super.key,
      this.filePickerResult,
      required this.onFilePick,
      required this.onDeleteSelectedFile});
  final FilePickerResult? filePickerResult;
  void Function(FilePickerResult? file) onFilePick;
  void Function() onDeleteSelectedFile;

  @override
  State<DsImagePicker> createState() => _DsImagePickerState();
}

class _DsImagePickerState extends State<DsImagePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png'],
        );

        widget.onFilePick(result);
      },
      child: widget.filePickerResult != null
          ? DecoratedBox(
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
                      widget.filePickerResult!.files.first.name,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.onDeleteSelectedFile();
                      },
                      child: const Icon(
                        Icons.delete,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Expanded(
              child: DottedBorder(
                strokeWidth: 4,
                dashPattern: [12, 8],
                color: Color(0xFF8E8E8E),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.assets_upload_png,
                          width: 24,
                        ),
                        const Text(
                          'Imagem da vaga',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
