import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pantry_app/Controllers/theme_changer.dart';
import 'package:provider/provider.dart';

class SvgIcon extends StatelessWidget {
  final String asset;
  final double? size;
  final Color? color;
  final bool useOriginalColors;

  const SvgIcon({
    Key? key,
    required this.asset,
    this.size,
    this.color,
    this.useOriginalColors = false,
  }) : super(key: key);

  bool get isUsingOriginalColors => useOriginalColors;

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    final resolvedColor = useOriginalColors
        ? null
        : color ??
            themeChanger.getTheme().iconTheme.color ??
            themeChanger.getTheme().colorScheme.onPrimary;

    // Convert the resolvedColor into a ColorFilter
    final resolvedColorFilter =
        (resolvedColor != null) ? ColorFilter.mode(resolvedColor, BlendMode.srcIn) : null;

    return SvgPicture.asset(
      asset,
      colorFilter: resolvedColorFilter,
      height: size ?? themeChanger.getTheme().iconTheme.size,
      width: size ?? themeChanger.getTheme().iconTheme.size,
    );
  }
}
