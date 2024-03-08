import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/configs/themes/color_theme.dart';
import 'package:testapp/configs/themes/text_theme.dart';
import 'package:testapp/controllers/categories_controller.dart';
import 'package:testapp/controllers/question_controller.dart';
import 'package:testapp/views/widgets/card_widget.dart';

class FAQSScreen extends StatefulWidget {
  const FAQSScreen({super.key});

  @override
  State<FAQSScreen> createState() => _FAQSScreenState();
}

class _FAQSScreenState extends State<FAQSScreen> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final QuestionController questionController = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorsThemes().white,
          ), // Custom icon color
          // onPressed: () => Navigator.of(context).pop(),
          onPressed: () => Get.back(closeOverlays: true),
        ),
        title: const Text('សំណួរ និង ចម្លើយ'),
        centerTitle: false,
        titleTextStyle: TextThemes.appBarTextStyle,
        backgroundColor: ColorsThemes().darkBlue,
      ),
      backgroundColor: ColorsThemes().lighBlue,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                if (categoriesController.categories.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: categoriesController.categories.length,
                    itemBuilder: (context, index) {
                      final category = categoriesController.categories[index];
                      return CardWidget(
                        image: Image.network(
                          'http://128.199.167.207:3838/api/v01/faqs/categories/dashboard/${category.icon}',
                          width: 30,
                          height: 30,
                        ),
                        title: category.name,
                      );
                    },
                  );
                }
              }),
              const Divider(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'សំណួរ ពេញនិយម',
                      style: TextThemes.headingTextStyle,
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (questionController.questions.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questionController.questions.length,
                    itemBuilder: (context, index) {
                      final question = questionController.questions[index];
                      return GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, question.description);
                        },
                        child: Card(
                          color: ColorsThemes().white,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 70,
                            child: ListTile(
                              title: Text(
                                question.name,
                                style: TextThemes.listTextStyle,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String title) {
    setState(() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        // useSafeArea: true,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Text(
                title,
                style: TextThemes.listTextStyle,
              ),
            ),
          );
        },
      );
    });
  }
}
