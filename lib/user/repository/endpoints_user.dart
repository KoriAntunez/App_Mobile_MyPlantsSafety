import 'package:hungry/routes/api_base.dart';

class EndPointsUser {
  //Instanciando ruta base
  ApiBase rutaBase = ApiBase();

  String resourceLogin() {
    return rutaBase.getRouteApi("Usuario/login");
  }
}
