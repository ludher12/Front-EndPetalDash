import 'package:get/get.dart';

import '../environment/environment.dart';
import '../models/User.dart';

class UserProvider extends GetConnect{
  String url = Environment.API_URL + 'api/users';

  Future<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(), headers: {
      'Content-Type': 'application/json'
    }); //Espera hasta que el servidor nos retorne la respuesta
    return response;
  }
}