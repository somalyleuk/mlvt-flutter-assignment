import 'package:flutter/material.dart';
import 'package:testapp/configs/themes/color_theme.dart';
import 'package:testapp/configs/themes/text_theme.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final Widget image;
  final void Function()? onTap;
  const CardWidget(
      {super.key, required this.title, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: ColorsThemes().white,
        child: Container(
          width: 120,
          height: 500,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
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
