import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final AssetImage image;
  final void Function()? onTap;
  const CardWidget(
      {super.key, required this.title, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image(image: image),
            Text(title),
          ],
        ),
      ),
    );
  }
}
