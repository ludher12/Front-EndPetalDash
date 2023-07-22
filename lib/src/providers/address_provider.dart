import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
<<<<<<< HEAD
import 'package:petaldash/src/models/address.dart';
import '../environment/environment.dart';
import '../models/User.dart';
import '../models/category.dart';
import '../models/response_api.dart';

class AddressProvider extends GetConnect {
  String url = Environment.API_URL + 'api/address';
  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  /*Future<List<Category>> getAll() async {
    Response response = await get('$url/getAll', headers: {
      'Content-Type': 'application/json',
      'Authorization': userSession.sessionToken ?? ''
    }); //Espera hasta que el servidor nos retorne la respuesta

    if (response.statusCode == 401) {
      Get.snackbar('Peticion denegada',
          'Tu usuario no tiene permitido leer esta peticion');
      return [];
    }


    List<Category> categories = Category.fromJsonList(response.body);
    return categories;
  }*/

  Future<ResponseApi> create(Address address) async {
    Response response = await post('$url/create', address.toJson(), headers: {
      'Content-Type': 'application/json',
      'Authorization': userSession.sessionToken!
    }); //Espera hasta que el servidor nos retorne la respuesta
=======

import '../environment/environment.dart';
import '../models/User.dart';
import '../models/address.dart';
import '../models/response_api.dart';


class AddressProvider extends GetConnect {

  String url = Environment.API_URL + 'api/address';

  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  Future<List<Address>> findByUser(String idUser) async {
    Response response = await get(
        '$url/findByUser/$idUser',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': userSession.sessionToken ?? ''
        }
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.statusCode == 401) {
      Get.snackbar('Peticion denegada', 'Tu usuario no tiene permitido leer esta informacion');
      return [];
    }

    List<Address> address = Address.fromJsonList(response.body);

    return address;
  }

  Future<ResponseApi> create(Address address) async {
    Response response = await post(
        '$url/create',
        address.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': userSession.sessionToken ?? ''
        }
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA
>>>>>>> a22e91bed4c6d19070b38512dbd3971886f8b041

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
<<<<<<< HEAD
}
=======

}
>>>>>>> a22e91bed4c6d19070b38512dbd3971886f8b041
