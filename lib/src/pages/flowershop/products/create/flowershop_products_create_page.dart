import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:petaldash/src/pages/flowershop/categories/create/flowershop_categories_create_controller.dart';

import 'flowershop_products_create_controller.dart';

class flowershopProductsCreatePage extends StatelessWidget {

  FlowershopProductsCreateController con = Get.put(FlowershopProductsCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Posicionar elementos uno encima de otro
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _textNewCategory(context),
        ],
      ),
    );
  }


  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.35,
      color: Color(0xFFBB85B4),
      alignment: Alignment.topCenter,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .size
              .height * 0.18, left: 50, right: 50),
      height: MediaQuery
          .of(context)
          .size
          .height * 0.7,
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldCategory(),
            _textFieldDescription(),
            _textFieldPrice(),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  GetBuilder<FlowershopProductsCreateController>
                    (builder: (value) => _cardImage(context, con.imagefile1, 1)
                  ),
                  SizedBox(width: 5),
                  GetBuilder<FlowershopProductsCreateController>
                    (builder: (value) => _cardImage(context, con.imagefile2, 2)
                  ),
                  SizedBox(width: 5),
                  GetBuilder<FlowershopProductsCreateController>
                    (builder: (value) => _cardImage(context, con.imagefile3, 3)
                  ),
                ],
              ),
            ),
            _buttonCreate(context)
          ],
        ),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 15),
        child: Text(
          'INGRESE SUS DATOS',
          style: TextStyle(color: Colors.black),
        ));
  }

  Widget _cardImage(BuildContext context,File? imageFile, int numberFile){
    return GestureDetector(
          onTap: () => con.showAlertDialog(context, numberFile),
          child: Container(
            height: 70,
              width: MediaQuery.of(context).size.width * 0.18,
              child: imageFile != null ?
              Image.file(
                imageFile,
                fit: BoxFit.cover,
              )
                  :Image(image: AssetImage('assets/img/addImg.jpg'),
              )
          )
    );
  }


  Widget _textFieldCategory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration:
        InputDecoration(hintText: 'Nombre',
            prefixIcon: Icon(Icons.category)),
      ),
    );
  }

  Widget _textFieldPrice() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: con.priceController,
        keyboardType: TextInputType.number,
        decoration:
        InputDecoration(hintText: 'Precio',
            prefixIcon: Icon(Icons.attach_money)),
      ),
    );
  }

  Widget _textFieldDescription() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: TextField(
        controller: con.descriptionController,
        keyboardType: TextInputType.text,
        maxLines: 4,
        decoration: InputDecoration(
            hintText: 'Descripcion',
            prefixIcon: Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Icon(Icons.description))),
      ),
    );
  }


  Widget _buttonCreate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          onPressed: () => con.createCategory(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 13)),
          child: Text(
            'CREAR PRODUCTO',
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _textNewCategory(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 25),
        child: Text('NUEVO PRODUCTO', style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25)),
      ),
    );
  }


}
