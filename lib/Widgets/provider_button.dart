import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pantry_app/Widgets/svg_icon.dart';
import 'package:provider/provider.dart';
import 'package:pantry_app/Controllers/theme_changer.dart';

class ProviderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String? fontFamily;
  final dynamic icon;
  final dynamic iconDark;
  final Color? buttonColor;
  final Color? onButtonColor;
  final Color? buttonColorDark;
  final Color? onButtonColorDark;

  const ProviderButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.fontFamily,
    this.icon,
    this.iconDark,
    this.buttonColor,
    this.onButtonColor,
    this.buttonColorDark,
    this.onButtonColorDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Provider.of<ThemeChanger>(context).getTheme();

    Color? buttonColorToUse = theme.brightness == Brightness.light ? buttonColor : buttonColorDark;

    // If onButtonColor or onButtonColorDark is not provided, fallback to onPrimary
    Color? textColorToUse = theme.brightness == Brightness.light
        ? onButtonColor ?? theme.colorScheme.onPrimary
        : onButtonColorDark ?? theme.colorScheme.onPrimary;

    dynamic chosenIcon = theme.brightness == Brightness.light ? icon : (iconDark ?? icon);

    Widget leading = const SizedBox.shrink();
    Color iconColor = textColorToUse; // Now directly using the determined text color

    if (chosenIcon is Icon) {
      leading = Icon(
        (chosenIcon).icon,
        size: 24.0,
        color: iconColor,
      );
    } else if (chosenIcon is Image) {
      leading = ColorFiltered(
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        child: Image(
          image: (chosenIcon).image,
          height: 40.0,
        ),
      );
    } else if (chosenIcon is String) {
      leading = ColorFiltered(
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        child: SvgPicture.asset(
          chosenIcon,
          height: 40.0,
        ),
      );
    } else if (chosenIcon is SvgIcon) {
      leading = (chosenIcon.isUsingOriginalColors)
          ? chosenIcon // If using original colors, use the icon as is
          : SvgIcon(
              // If not using original colors, apply the iconColor
              asset: chosenIcon.asset,
              color: iconColor,
              size: chosenIcon.size,
            );
    } else if (chosenIcon != null) {
      leading = chosenIcon as Widget;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(buttonColorToUse ?? theme.colorScheme.primary),
        foregroundColor: MaterialStateProperty.all<Color>(textColorToUse),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
        fixedSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 40.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          leading,
          Expanded(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: textColorToUse,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
