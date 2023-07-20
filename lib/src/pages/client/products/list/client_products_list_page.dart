import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaldash/src/models/category.dart';
import 'package:petaldash/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:petaldash/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:petaldash/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:petaldash/src/pages/flowershop/orders/list/flowershop_orders_list_page.dart';
import 'package:petaldash/src/pages/register/register_page.dart';
import 'package:petaldash/src/utils/custom_animated_bottom_bar.dart';



class ClientProductsListPage extends StatelessWidget {

  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: con.categories.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Color(0xFF540748),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white60,
              tabs: List<Widget>.generate(con.categories.length, (index) {
                return Tab(
                  child: Text(con.categories[index].name ?? ''),
                );
            }),
            ),
          ),
        ),
        body: TabBarView(
          children: con.categories.map((Category category) {
            return Container();
          }).toList(),
        )
      ),
    );
  }
}