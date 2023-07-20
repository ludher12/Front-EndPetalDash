import 'package:get/get.dart';
import 'package:petaldash/src/models/category.dart';
import 'package:petaldash/src/providers/categories_providers.dart';

class ClientProductsListController extends GetxController {

  CategoriesProvider categoriesProvider = CategoriesProvider();
  List<Category> categories = <Category>[].obs;

  ClientProductsListController() {
    getCategories();
    }

  void getCategories() async {
    var result = await categoriesProvider.getAll();
    categories.clear();
    categories.addAll(result);
  }


}