import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:testapp/configs/themes/color_theme.dart';
import 'package:testapp/configs/themes/text_theme.dart';
import 'package:testapp/presentation/controllers/categories_controller.dart';
import 'package:testapp/presentation/controllers/question_controller.dart';
import 'package:testapp/presentation/widgets/card_widget.dart';

class FAQSView extends StatefulWidget {
  const FAQSView({super.key});

  @override
  State<FAQSView> createState() => _FAQSViewState();
}

class _FAQSViewState extends State<FAQSView> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final QuestionController questionController = Get.put(QuestionController());
  final List<String> svgUrls = [
    'assets/images/1790860289024690.svg',
    'assets/images/1790856818251272.svg',
    'assets/images/1790857435835753.svg',
    'assets/images/1790868118554426.svg',
    'assets/images/1790864271401405.svg',
    'assets/images/1790864316048429.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorsThemes().white,
          ),
          onPressed: () {
            // Navigator.pop(context);
            Navigator.of(context, rootNavigator: true).pop(context);
          },
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
                      childAspectRatio: 0.7,
                    ),
                    itemCount: categoriesController.categories.length,
                    itemBuilder: (context, index) {
                      final svgUrl = svgUrls[index % svgUrls.length];
                      final category = categoriesController.categories[index];
                      return CardWidget(
                        title: category.name,
                        svgPath: svgUrl,
                      );
                    },
                  );
                }
              }),
              const Divider(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  return const Center();
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
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Html(data: title),
          ),
        );
      },
    );
  }
}
