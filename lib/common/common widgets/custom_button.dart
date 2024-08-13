import 'package:flutter/material.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.icon,
    this.bgcolor,
    this.fgcolor,
    this.elevation,
    this.borderColor,
    this.textStyle,
  });
  final Function? onPressed;
  final String? text;
  final Widget? icon;
  final Color? bgcolor;
  final Color? fgcolor;
  final double? elevation;
  final Color? borderColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed != null
          ? () {
              onPressed!();
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor ?? AppColors.appViolet,
        foregroundColor: fgcolor ?? AppColors.white,
        elevation: elevation ?? 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none),
      ),
      child: icon != null && text != null
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    text ?? "",
                    style: textStyle,
                  ),
                  icon!,
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: icon ??
                  Text(
                    text ?? "",
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
            ),
    );
  }
}
