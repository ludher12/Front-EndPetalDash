import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petaldash/src/models/response_api.dart';
import 'package:petaldash/src/providers/user_providers.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserProvider userProvider = UserProvider();

  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    //Get.snackbar('Email', email);
    //Get.snackbar('Password', password);
    if(isValidForm(email,password)){
      ResponseApi responseApi = await userProvider.login(email, password);

      print('Response Api: ${responseApi.toJson()}');

      if(responseApi.success == true) {
        GetStorage().write('user', responseApi.data); // datos del usuario en sesion
        goToHomePage();
      }else{
        Get.snackbar('Login fallido', responseApi.message ?? '');
      }
    }
  }

  void goToHomePage(){
    Get.offNamedUntil('/home', (route) => false);
  }

  bool isValidForm(String email, String password){
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }
    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar la contraseña');
      return false;
    }
    return true;

  }
}