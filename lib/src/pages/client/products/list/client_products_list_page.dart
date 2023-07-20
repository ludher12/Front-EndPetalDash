import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaldash/src/pages/client/products/list/clientt_products_list_controller.dart';
import 'package:petaldash/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:petaldash/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:petaldash/src/pages/flowershop/orders/list/flowershop_orders_list_page.dart';
import 'package:petaldash/src/pages/register/register_page.dart';
import 'package:petaldash/src/utils/custom_animated_bottom_bar.dart';



class ClientProductsListPage extends StatelessWidget {

  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Cliente products list')),);
  }
}