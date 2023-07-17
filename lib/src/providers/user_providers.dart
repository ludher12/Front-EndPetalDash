import 'package:get/get.dart';
import 'package:petaldash/src/models/response_api.dart';
import 'package:petaldash/src/environment/environment.dart';
import 'package:petaldash/src/models/user.dart';

class UserProvider extends GetConnect{
  String url = Environment.API_URL + 'api/users';

  Future<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(), headers: {
      'Content-Type': 'application/json'
    }); //Espera hasta que el servidor nos retorne la respuesta
    return response;
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post('$url/login',{
    'email': email,
    'password': password
    }, headers: {
      'Content-Type': 'application/json'
    }); //Espera hasta que el servidor nos retorne la respuesta

    if(response.body == null){
      Get.snackbar('Error', 'No se pudo ejecutar la petición');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}

