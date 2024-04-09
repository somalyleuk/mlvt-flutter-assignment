import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mlvt_flutter_assignment/configs/themes/color_theme.dart';
import 'package:mlvt_flutter_assignment/configs/themes/text_theme.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  final void Function()? onTap;
  const CardWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: ColorsThemes().white,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: TextThemes.cardTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
