import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/configs/themes/color_theme.dart';
import 'package:testapp/configs/themes/image_theme.dart';
import 'package:testapp/configs/themes/text_theme.dart';
import 'package:testapp/views/screens/faqs_screen/faqs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> widgetList = ['Geeks', 'for', 'Geeks'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        titleTextStyle: TextThemes.appBarTextStyle,
        backgroundColor: ColorsThemes().darkBlue,
      ),
      backgroundColor: ColorsThemes().lighBlue,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () {
            // Get.off(const FAQSScreen());
            Get.off(() => const FAQSScreen());
          },
          child: Card(
            color: ColorsThemes().white,
            child: SizedBox(
              width: 150,
              height: 200,
              child: Container(
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
      ),
    );
  }
}
