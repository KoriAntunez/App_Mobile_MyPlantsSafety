import 'package:fluttermlprediction/user/repository/api_base.dart';

class EndPointsUser {
  //INSTANCIA DE RUTA BASE
  ApiBase rutaBase = ApiBase();

  String resourceLogin() {
    return rutaBase.getRouteApi("Usuario");
  }
}
