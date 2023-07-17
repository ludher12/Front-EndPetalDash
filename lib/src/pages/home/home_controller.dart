import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petaldash/src/models/user.dart';


class HomeController extends GetxController{
  User user = User.fromJson(GetStorage().read('user') ?? {});

  HomeController(){
    print('USUARIO EN SESIÓN: ${user.toJson()}');
  }

}