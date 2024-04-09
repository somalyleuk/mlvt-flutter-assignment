import 'package:get/get.dart';
import 'package:mlvt_flutter_assignment/models/faqs_model/categories_model.dart';
import 'package:mlvt_flutter_assignment/service/api_service.dart';

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
