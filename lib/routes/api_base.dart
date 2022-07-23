class ApiBase {
  final ROUTE_BASE_API = "https://my-plant-safety.herokuapp.com/api/";

  //Creamos una funcion para definir el punto de enlace al servicio de datos, para consumir desde el repository
  getRouteApi(String endpoint) {
    return ROUTE_BASE_API.toString() + endpoint;
  }
}
