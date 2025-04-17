import 'package:flutter/material.dart';
import 'package:hirafi/utils/app_theme.dart';

class AppColors {
  static const Color primaryColor = Color(0xffff3600);
  static const Color blackColor = Color(0xff171717);
  static const Color greyColor = Color(0xff808080);
  static const Color whiteColor = Color(0xffffffff);

  // CARDS SHADOW COLOR
  static Color shadowColor =
      greyColor.withValues(alpha: AppThemes.SHADOW_OPACITY);
}
