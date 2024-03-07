import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:responsive_framework/responsive_framework.dart';
import 'package:testapp/configs/themes/color_theme.dart';
import 'package:testapp/configs/themes/image_theme.dart';
import 'package:testapp/configs/themes/text_theme.dart';
import 'package:testapp/views/screens/faqs_screen/faqs_screen.dart';
import 'package:testapp/views/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> widgetList = ['Geeks', 'for', 'Geeks'];

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        titleTextStyle: TextThemes.h1,
        backgroundColor: ColorsThemes().darkBlue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          itemCount: 1,
          itemBuilder: (ctx, i) {
            return CardWidget(
              onTap: () {
                Get.off(const FAQSScreen());
              },
              title: 'សំណួរ និង ចម្លើយ',
              image: ImageThemes().image1,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            // mainAxisExtent: 264,
          ),
        ),
      ),
    );
  }
}
