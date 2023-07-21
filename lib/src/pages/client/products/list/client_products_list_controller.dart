import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:petaldash/src/models/category.dart';
import 'package:petaldash/src/providers/categories_providers.dart';
import 'package:petaldash/src/providers/products_provider.dart';

import '../../../../models/product.dart';
import '../detail/client_products_detail_page.dart';

class ClientProductsListController extends GetxController {

  CategoriesProvider categoriesProvider = CategoriesProvider();
  ProductsProvider productsProvider = ProductsProvider();


  List<Category> categories = <Category>[].obs;

  ClientProductsListController() {
    getCategories();
  }

  void getCategories() async {
    var result = await categoriesProvider.getAll();
    categories.clear();
    categories.addAll(result);
  }

  Future<List<Product>> getProducts(String idCategory) async {
    return await productsProvider.findByCategory(idCategory);
  }

  void openBottomSheet(BuildContext context,Product product){
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ClientProductsDetailPage(product: product,)
    );
    }
}