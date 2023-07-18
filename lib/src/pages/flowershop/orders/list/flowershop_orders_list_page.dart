import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaldash/src/pages/flowershop/orders/list/flowershop_orders_list_controller.dart';

class FlowershopOrdersListPage extends StatelessWidget {

  FlowershopOrdersListController con = Get.put(FlowershopOrdersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Flowershop Orders List'),
      ),
    );
  }
}
