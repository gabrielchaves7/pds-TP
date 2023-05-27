import 'package:flutter/material.dart';
import 'package:premium_todo/design_system/atoms/serasa_app_bar.dart';
import 'package:premium_todo/design_system/design_system.dart';

/// The default page with background color and appbar set.
/// Use it on every page you create.
class SerasaPage extends StatelessWidget {
  ///
  const SerasaPage({required this.body, super.key});

  /// The body to be rendered inside the scaffold widget
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SerasaAppBar().build(context),
      backgroundColor: DsColors.background,
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: body,
      ),
    );
  }
}
