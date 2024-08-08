import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ImageLoader {
  ImageLoader._();

  static Widget asset(
      String assetName, {
        double? height,
        double? width,
        Color? color,
        BoxFit? fit,
      }) {
    return Image.asset(assetName,
        height: height, width: width, color: color, fit: fit ?? BoxFit.contain);
  }

  static Widget assetSvg(
      String assetName, {
        double? height,
        double? width,
        Color? color,
        BoxFit? fit,
      }) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      color: color,
      fit: fit ?? BoxFit.contain,
    );
  }

  static Widget networkSvg(
      String assetName, {
        double? height,
        double? width,
        Color? color,
      }) {
    return SvgPicture.network(
      assetName,
      height: height,
      width: width,
      color: color,
      fit: BoxFit.cover,
    );
  }

  static Widget assetLottie(String assetName,
      {double? height,
        double? width,
        Color? color,
        BoxFit? fit,
        bool? repeat}) {
    return Lottie.asset(
      assetName,
      height: height,
      width: width,
      repeat: repeat,
      fit: fit ?? BoxFit.contain,
    );
  }

  static Widget network(
      String url, {
        double? height,
        double? width,
        Color? color,
        BoxFit? fit,
        double? errorImageHeight,
        double? errorImageWidth,
      }) {
    return Image.network(
      url,
      height: height,
      width: width,
      color: color,
      fit: fit ?? BoxFit.contain,
      /*  loadingBuilder: (context, loading, stackTrace) {
        return ImageLoader.asset(ImagePath.icImagePlaceholder,
            fit: BoxFit.fill);
      },*/
      errorBuilder:
          (BuildContext? context, Object? exception, StackTrace? stackTrace) {
        //todo add default image
        return Container();
        // return Center(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Material(
        //         elevation: 5,
        //         child: ClipRRect(
        //             borderRadius: const BorderRadius.all(Radius.circular(5)),
        //             child: ImageLoader.asset(ImagePath.icNewsPaperPhoto,
        //                 width:
        //                     errorImageWidth ?? 80 * SizeConfig.widthMultiplier!,
        //                 height: errorImageHeight ??
        //                     100 * SizeConfig.heightMultiplier!,
        //                 fit: BoxFit.fill)),
        //       ),
        //       SizedBox(
        //         height: 8 * SizeConfig.heightMultiplier!,
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }
}
