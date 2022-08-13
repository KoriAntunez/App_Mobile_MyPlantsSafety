class RegisterModel {
  int Id;
  String nombre;
  String apellidos;
  String email;
  String password;
  RegisterModel(
      {this.Id, this.nombre, this.apellidos, this.email, this.password});
  factory RegisterModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return RegisterModel(
      Id: parsedJson["id"],
      nombre: parsedJson["nombre"] as String,
      apellidos: parsedJson["apellidos"] as String,
      email: parsedJson["email"] as String,
      password: parsedJson["password"] as String,
    );
  }
}