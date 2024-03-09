import 'package:get/get.dart';
import 'package:testapp/service/api_service.dart';

import 'package:testapp/models/faqs_model/questions_model.dart';

class QuestionController extends GetxController {
  var questions = <QuestionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await ApiService.fetchData();
      questions.assignAll(data['questions']
          .map<QuestionModel>((question) => QuestionModel.fromJson(question)));
    } catch (e) {
      print('Error fetching data: $e ');
    }
  }
}
