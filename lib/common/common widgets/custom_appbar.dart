import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../core/responsive/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
    this.imageTitle,
    this.textTitle,
    this.trailingWidget,
    this.leadingWidget,
    this.onTapLeading,
    this.onTapTrailing,
    this.disableBottomDivider,
    this.elevation,
    this.onTapBack,
    this.backgroundColor,
    this.leadingWidth,
    this.height,
  });

  final Widget? imageTitle;
  final Widget? textTitle;
  final Widget? trailingWidget;
  final Widget? leadingWidget;
  final VoidCallback? onTapLeading;
  final VoidCallback? onTapTrailing;
  final bool? disableBottomDivider;
  final double? elevation;
  final Color? backgroundColor;
  final double? leadingWidth;
  final double? height;

  final VoidCallback? onTapBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      flexibleSpace: Container(
        color: backgroundColor,
      ),
      title: (imageTitle != null) ? imageTitle : textTitle,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: (disableBottomDivider ?? false)
            ? const SizedBox.shrink()
            : Container(
                color: AppColors.gray20,
                height: 2 * SizeConfig.heightMultiplier!,
              ),
      ),
      titleSpacing: 0,
      leadingWidth: leadingWidth,
      leading: (leadingWidget != null)
          ? GestureDetector(
              onTap: onTapLeading,
              child: leadingWidget,
            )
          : GestureDetector(
              onTap: (onTapBack != null)
                  ? onTapBack
                  : () {
                      Navigator.pop(context);
                    },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.neutral14,
                size: 24 * SizeConfig.heightMultiplier!,
              ),
            ),
      actions: [
        (trailingWidget != null)
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15 * SizeConfig.widthMultiplier!,
                ),
                child: GestureDetector(
                  onTap: onTapTrailing,
                  child: trailingWidget,
                ),
              )
            : const SizedBox.shrink()
      ],
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height ?? SizeConfig.screenHeight! * 0.1);
}
