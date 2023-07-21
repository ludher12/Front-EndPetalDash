import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaldash/src/models/category.dart';
import 'package:petaldash/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:petaldash/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:petaldash/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:petaldash/src/pages/flowershop/orders/list/flowershop_orders_list_page.dart';
import 'package:petaldash/src/pages/register/register_page.dart';
import 'package:petaldash/src/utils/custom_animated_bottom_bar.dart';

import '../../../../models/product.dart';
import '../../../../widgets/no_data_widget.dart';



class ClientProductsListPage extends StatelessWidget {

  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  DefaultTabController(
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
             return FutureBuilder(
              future: con.getProducts(category.id ?? '1'),
              builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.hasData) {

                  if(snapshot.data!.length >0){
                    return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (_, index) {
                          return _cardProduct(context,snapshot.data! [index]) ;
                        }
                    );
                  }else{
                    return NoDataWidget(text: 'No hay productos',);
                  }

                } else{
                  return NoDataWidget(text: 'No hay productos',);
                }
              }
             );
          }).toList(),
        )
      ),
    ));
  }

  Widget _cardProduct(BuildContext context,Product product) {
    return GestureDetector(
      onTap: () => con.openBottomSheet(context, product),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, left: 20, right: 20),
            child: ListTile(
                title: Text(product. name ??''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.description ?? '',
                        maxLines: 2,
                        ),
                        SizedBox(height: 5),
                        Text( '\$${product.price.toString()}',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ), SizedBox(height: 20,)
                      ],
                    ),
                    trailing: Container(
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage(
                        image: product.image1 != null
                        ? NetworkImage(product. image1! )
                        : AssetImage('assets/img/no-image.png') as ImageProvider,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 50),
                placeholder: AssetImage( 'assets/img/no-image.png' ) ,
            ),
                      ),
                    ) , // Fadelnlmage
            ),
          ),
          Divider(height: 1, color: Colors.grey[300], indent: 35,endIndent: 35, )
        ],
      ),
    ); // ListTile

}
}