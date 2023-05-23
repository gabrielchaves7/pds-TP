import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/serasa_logo.dart';
import 'package:premium_todo/design_system/design_system.dart';

/// AppBar with logo
class SerasaAppBar extends StatelessWidget {
  ///
  const SerasaAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: DsColors.background,
      title: const SerasaLogo(),
      centerTitle: true,
    );
  }
}
