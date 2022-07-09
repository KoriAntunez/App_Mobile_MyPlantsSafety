class LoginModel {
  int id;
  String nombres;
  String apellidos;
  String email;
  String password;
  LoginModel(
      {this.id, this.nombres, this.apellidos, this.email, this.password});
  factory LoginModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return LoginModel(
      id: parsedJson["id"],
      nombres: parsedJson["nombres"] as String,
      apellidos: parsedJson["apellidos"] as String,
      email: parsedJson["email"] as String,
      password: parsedJson["password"] as String,
    );
  }
}
