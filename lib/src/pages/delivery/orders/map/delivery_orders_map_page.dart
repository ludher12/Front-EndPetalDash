import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petaldash/src/pages/delivery/orders/map/delivery_orders_map_controller.dart';

class DeliveryOrdersMapPage extends StatelessWidget {
  DeliveryOrdersMapController con = Get.put(DeliveryOrdersMapController());

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       iconTheme: IconThemeData(color: Colors.black),
  //       title: Text(
  //         'Ubica tu dirección en el mapa',
  //         style: TextStyle(color: Colors.black),
  //       ),
  //     ),
  //     body: Stack(
  //       children: [_googleMaps(),_iconMyLocation(),_cardAddress(), _buttonAccept(context)],
  //     ), // Stack
  //   ); // Scaffold
  // }

  //
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryOrdersMapController> (
        builder: (value) => Scaffold(
          backgroundColor: Colors.grey[900],
          body: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: _googleMaps()
              ),
              SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonBack(),
                        _iconCenterMyLocation(),
                      ],
                    ),
                    Spacer(),
                    _cardOrderInfo(context),
                  ],
                ),
              ),
              // _buttonAccept(context)
            ],
          ),
        ));
  }

  Widget _buttonBack() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 20),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _cardOrderInfo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xF5001D3B),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 10,
                blurRadius: 6,
                offset: Offset(0, 3)
            )
          ]
      ),
      child: Column(
        children: [
          _listTileAddress(
              con.order.address?.neighborhood ?? '',
              'Barrio',
              Icons.my_location
          ),
          _listTileAddress(
              con.order.address?.address ?? '',
              'Direccion',
              Icons.location_on
          ),
          Divider(color: Colors.grey, endIndent: 30, indent: 30),
          _clientInfo(),
          _buttonAccept(context)
        ],
      ),
    );
  }

  Widget _clientInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Row(
        children: [
          _imageClient(),
          SizedBox(width: 15),
          Text(
            '${con.order.client?.name ?? ''} ${con.order.client?.lastname ?? ''}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
            maxLines: 1,
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.grey[200]
            ),
            child: IconButton(
              onPressed: () => con.callNumber(),
              icon: Icon(Icons.phone, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget _imageClient() {
    return Container(
      height: 50,
      width: 50,
      // padding: EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FadeInImage(
          image: con.order.client!.image != null
              ? NetworkImage(con.order.client!.image!)
              : AssetImage('assets/img/no-image.png') as ImageProvider,
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 50),
          placeholder:  AssetImage('assets/img/no-image.png'),
        ),
      ),
    );
  }

  Widget _listTileAddress(String title, String subtitle, IconData iconData) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontSize: 13,
              color: Colors.white
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        trailing: Icon(iconData, color: Colors.white,),
      ),
    );
  }

  Widget _buttonAccept(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 40, right: 40),
      child: ElevatedButton(
       onPressed: () => con.selectRefPoint(context),
        child: Text(
          'ENTREGAR PEDIDO',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: Color(0xF5DEDEDE),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            padding: EdgeInsets.all(15)
        ),

      ),
    );
  }

  Widget _iconCenterMyLocation() {
    return GestureDetector(
      onTap: () => con.centerPosition(),
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          shape: CircleBorder(),
          color: Colors.white,
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.location_searching,
              color: Colors.grey[600],
              size: 20,
            ),
          ),
        ),
      ),
    );
  }


  Widget _googleMaps() {
    return GoogleMap(
      initialCameraPosition: con.initialPosition,
      mapType: MapType.normal,
      onMapCreated: con.onMapCreate,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      markers: Set<Marker>.of(con.markers.values),
      polylines: con.polylines,
    );
  }
}
