import 'package:flutter/material.dart';

class DsIconAndTitle extends StatelessWidget {
  DsIconAndTitle({required this.icon, required this.title, super.key});
  Widget icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
