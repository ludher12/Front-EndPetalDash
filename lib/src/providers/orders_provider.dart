import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:petaldash/src/environment/environment.dart';
import 'package:petaldash/src/models/category.dart';
import 'package:petaldash/src/models/order.dart';
import 'package:petaldash/src/models/response_api.dart';
import 'package:petaldash/src/models/user.dart';

class OrdersProvider extends GetConnect {

  String url = Environment.API_URL + 'api/orders';

  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  Future<ResponseApi> create(Order order) async {
    Response response = await post(
        '$url/create',
        order.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': userSession.sessionToken ?? ''
        }
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }




}