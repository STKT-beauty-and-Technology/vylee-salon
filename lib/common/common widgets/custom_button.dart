import 'package:flutter/material.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.frontIcon,
    this.backIcon,
    this.bgcolor,
    this.fgcolor,
    this.elevation,
    this.borderColor,
    this.textStyle,
    this.borderRadius,
    this.frontIconSpacing,
    this.trailingIconSpacing,
    this.child,
  });
  final Function? onPressed;
  final String? text;
  final Widget? frontIcon;
  final Widget? backIcon;
  final Color? bgcolor;
  final Color? fgcolor;
  final double? elevation;
  final Color? borderColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Widget? child;
  final double? frontIconSpacing;
  final double? trailingIconSpacing;

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
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 2)
                : BorderSide.none),
      ),
      child: (frontIcon != null || backIcon != null) &&
              (text != null || child != null)
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                      visible: frontIcon != null,
                      child: frontIcon ?? const SizedBox()),
                  SizedBox(width: frontIconSpacing),
                  Visibility(
                    visible: child == null,
                    replacement: child ?? const SizedBox(),
                    child: Text(
                      text ?? "",
                      style: textStyle,
                    ),
                  ),
                  SizedBox(width: trailingIconSpacing),
                  Visibility(
                      visible: backIcon != null,
                      child: backIcon ?? const SizedBox()),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: frontIcon ??
                  Visibility(
                    visible: child == null,
                    replacement: child ?? const SizedBox(),
                    child: Text(
                      text ?? "",
                      style: textStyle,
                    ),
                  ),
            ),
    );
  }
}
