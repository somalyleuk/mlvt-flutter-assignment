import 'package:flutter/material.dart';
import 'package:testapp/configs/themes/color_theme.dart';

class TextThemes {
  static final TextStyle appBarTextStyle = TextStyle(
    fontSize: 18,
    color: ColorsThemes().white,
    fontFamily: 'khMuollight',
  );

  static final TextStyle headingTextStyle = TextStyle(
    fontSize: 16,
    color: ColorsThemes().darkBlue,
    fontFamily: 'khMuollight',
  );

  static final TextStyle cardTextStyle = TextStyle(
    fontSize: 10,
    color: Colors.black87,
    fontFamily: 'khBattambang',
  );

  static final TextStyle listTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.black87,
    fontFamily: 'khBattambang',
  );
}
