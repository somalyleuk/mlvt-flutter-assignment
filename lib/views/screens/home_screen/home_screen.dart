import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_framework.dart';
import 'package:testapp/configs/themes/color_theme.dart';
import 'package:testapp/configs/themes/text_theme.dart';
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
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemCount: 4,
        itemBuilder: (ctx, i) {
          return CardWidget(
            onTap: () {},
            title: '',
            image: const AssetImage(''),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 5,
          mainAxisExtent: 264,
        ),
      ),
    );
  }
}
