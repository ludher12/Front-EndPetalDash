import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petaldash/src/providers/user_providers.dart';
import 'package:petaldash/src/models/user.dart';

class RegisterController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController= TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserProvider userProvider = UserProvider();


  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  void register() async{
    String email = emailController.text.trim();
    String name = nameController.text;
    String lasName = lastnameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    //Get.snackbar('Email', email);
    //Get.snackbar('Password', password);
    if(isValidForm(email,name, lasName, phone,password,confirmPassword)){

      User user = User(
        id: null,
        email: email,
        name: name,
        lastname: lasName,
        phone: phone,
        image: null,
        password: password,
        sessionToken:null,
      );

      Response response = await userProvider.create(user);
      
      print('Response: ${response.body}');

      Get.snackbar('Formulario valido', 'Estas listo para enviar la petición Http');
    }
  }

  bool isValidForm(String email,String name,String lastName, String phone, String password,   String confirmPassword){
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }
    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }
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
    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar la contraseña');
      return false;
    }
    if(confirmPassword.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes confirmar tu contraseña');
      return false;
    }

    if(password != confirmPassword){
      Get.snackbar('Formulario no valido', 'Las contraeñas no coinciden');
      return false;

    }

    return true;

  }
}