import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class svgpicture {
  SvgPicture SvgPicture_asset(String image_path,
      {double? height, double? width, Color? color_code}) {
    return SvgPicture.asset(
      image_path,
      height: height,
      width: width,
      color: color_code,
    );
  }

  Image Img_asset(String image_path,
      {double? height,
      double? width,
      Color? color_code,
      BlendMode? blendMode}) {
    return Image.asset(
      image_path,
      height: height,
      width: width,
      color: color_code,
      colorBlendMode: blendMode,
      // opacity: const AlwaysStoppedAnimation(2),
    );
  }

  Image Img_network(String image_path) {
    return Image.network(
      image_path,
        fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Image.network('https://via.placeholder.com/284x240',fit: BoxFit.fill,);
      },
      errorBuilder: (context, error, stackTrace) =>
          Image.network('https://via.placeholder.com/284x240',fit: BoxFit.fill),
    );
  }
}
