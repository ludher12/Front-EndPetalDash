
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../environment/environment.dart';
import '../models/User.dart';
import '../models/category.dart';
import '../models/response_api.dart';

class CategoriesProvider extends GetConnect{
  String url = Environment.API_URL + 'api/categories';
  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  Future<ResponseApi> create(Category category) async {
    Response response = await post('$url/create',
        category.toJson(),
        headers: {
      'Content-Type': 'application/json',
          'Authorization': userSession.sessionToken!
    }); //Espera hasta que el servidor nos retorne la respuesta

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }

}