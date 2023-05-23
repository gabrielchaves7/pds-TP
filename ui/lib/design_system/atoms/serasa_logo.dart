import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:premium_todo/assets.dart';

/// Widget that loads the svg logo.
class SerasaLogo extends StatelessWidget {
  ///Creates an SerasaLogo
  const SerasaLogo({
    super.key,
  });

  @override
  Widget build(Object context) {
    return Container(
      width: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        Assets.assets_logo_svg,
        semanticsLabel: 'Image with text Origin',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
