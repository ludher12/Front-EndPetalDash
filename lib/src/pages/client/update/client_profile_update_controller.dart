import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petaldash/src/models/User.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class ClientProfileUpdateController extends GetxController{

  User user = User.fromJson(GetStorage().read('user'));

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController= TextEditingController();
  TextEditingController phoneController = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? imagefile;

  ClientProfileUpdateController(){
    nameController.text = user.name ?? '';
    lastnameController.text = user.lastname ?? '';
    phoneController.text = user.phone ?? '';
  }
  void updateInfo(BuildContext context) async{
    String name = nameController.text;
    String lasName = lastnameController.text;
    String phone = phoneController.text;



    //Get.snackbar('Email', email);
    //Get.snackbar('Password', password);
    if(isValidForm(name, lasName, phone)){

      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Actualizando datos...');

      User myUser = User(
        id: user.id,
        name: name,
        lastname: lasName,
        phone: phone,
      );

      /*Stream stream = await userProvider.createWithImage(user, imagefile!);
      stream.listen((res) {
        progressDialog.close();
        ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

        if(responseApi.success== true){
          GetStorage().write('user', responseApi.data); // datos del usuario en sesion
          goToHomePage();
        }else{
          Get.snackbar('Registro fallido', responseApi.message ?? '');
        }

      });*/

    }
  }
  bool isValidForm(String name,String lastName, String phone){
    if(name.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar tu nombre');
      return false;
    }
    if(lastName.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar tus apellidos');
      return false;
    }
    if(phone.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar tu número de telefono');
      return false;
    }

    return true;

  }

  Future selectImage(ImageSource imageSource) async{
    XFile? image = await picker.pickImage(source: imageSource);
    if(image != null){
      imagefile = File (image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context){
    Widget galleryButton = ElevatedButton(
        onPressed: (){
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: Text('Galeria',
          style: TextStyle(color: Colors.black),
        )
    );
    Widget cameraButton = ElevatedButton(
        onPressed:() {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: Text('Camara',
          style: TextStyle(color: Colors.black),
        )
    );


    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [
        galleryButton,
        cameraButton
      ],
    );

    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;

    });
  }
}