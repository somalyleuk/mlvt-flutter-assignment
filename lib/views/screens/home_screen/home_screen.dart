import 'package:flutter/material.dart';
import 'package:mlvt_flutter_assignment/configs/themes/color_theme.dart';
import 'package:mlvt_flutter_assignment/configs/themes/image_theme.dart';
import 'package:mlvt_flutter_assignment/configs/themes/text_theme.dart';
import 'package:mlvt_flutter_assignment/views/screens/faqs_screen/faqs_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('តេស្តសាកល្បង'),
        titleTextStyle: TextThemes.appBarTextStyle,
        backgroundColor: ColorsThemes().darkBlue,
      ),
      backgroundColor: ColorsThemes().lighBlue,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FAQSScreen(),
              ),
            );
          },
          child: Card(
            color: ColorsThemes().white,
            child: SizedBox(
              width: 150,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: ImageThemes().image1,
                    width: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'សំណួរ និង ចម្លើយ',
                    style: TextThemes.cardTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
