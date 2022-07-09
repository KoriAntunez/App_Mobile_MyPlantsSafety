class LoginModel {
  int Id;
  String nombre;
  String apellido;
  String email;
  String password;
  LoginModel(
      {this.Id, this.nombre, this.apellido, this.email, this.password});
  factory LoginModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return LoginModel(
      Id: parsedJson["id"],
      nombre: parsedJson["nombre"] as String,
      apellido: parsedJson["apellido"] as String,
      email: parsedJson["email"] as String,
      password: parsedJson["password"] as String,
    );
  }
}
