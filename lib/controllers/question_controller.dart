import 'package:get/get.dart';
import 'package:mlvt_flutter_assignment/models/faqs_model/questions_model.dart';
import 'package:mlvt_flutter_assignment/service/api_service.dart';

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
