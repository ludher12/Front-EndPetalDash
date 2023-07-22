import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
