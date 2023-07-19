
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petaldash/src/models/User.dart';

class ClientProfileInfoController extends GetxController{

  User user = User.fromJson(GetStorage().read('user'));

  void singnOut(){
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false); // eliminar el historial de pantallas
  }

  void goToProfileUpdate (){
    Get.toNamed('/client/profile/update');
  }

}