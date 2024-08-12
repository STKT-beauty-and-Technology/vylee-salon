import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/app_colors.dart';

Widget iconComponent(IconData iconData, {Color? color, double size = 24}) {
  return Icon(
    iconData,
    size: size,
    color: color,
  );
}

Widget imageIconComponent(String iconData, {Color? color, double size = 24}) {
  return ImageIcon(
    AssetImage(iconData),
    size: size,
    color: color,
  );
}

Widget logo({double size = 162}) {
  return Container(
    height: size,
    width: size,
    decoration:
    const BoxDecoration(shape: BoxShape.circle, color: AppColors.gray600),
  );
}

Widget svgIconComponent(
    {required String iconData,
      Color? color,
      double size = 24,
      VoidCallback? ontap}) {
  return InkWell(
    onTap: ontap,
    child: SvgPicture.asset(
      iconData,
      color: color,
      height: size,
      width: size,
    ),
  );
}

Widget svgImageComponent(
    {required String iconData, required double width, required double height}) {
  return SvgPicture.asset(
    iconData,
    height: height,
    width: width,
  );
}
