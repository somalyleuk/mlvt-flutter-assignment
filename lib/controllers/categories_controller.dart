import 'package:get/get.dart';
import 'package:testapp/service/api_service.dart';
import 'package:testapp/models/faqs_model/categories_model.dart';

class CategoriesController extends GetxController {
  var categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await ApiService.fetchData();
      categories.assignAll(data['categories']
          .map<CategoryModel>((category) => CategoryModel.fromJson(category)));
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
