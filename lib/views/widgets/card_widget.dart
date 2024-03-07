import 'package:flutter/material.dart';
import 'package:testapp/configs/themes/color_theme.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final AssetImage image;
  final void Function()? onTap;
  const CardWidget(
      {super.key, required this.title, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsThemes().white,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: image,
                width: 30,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
