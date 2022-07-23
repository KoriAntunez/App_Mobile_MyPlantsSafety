import 'dart:async';
import 'dart:convert';
import 'dart:js';
import 'package:http/http.dart' as http;
import 'package:hungry/user/model/usuario.dart';
import 'package:hungry/user/repository/authentication.dart';
//import 'package:logging/logging.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:hungry/user/repository/endpoints_user.dart';

// Caso de uso: Iniciar sesión como usuario
class LoginUseCase {
  //extends CompletableUseCase<LoginUseCaseParams> {
  //Authentication authentication;
  //Logger logger;

  static void login(String email, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse(EndPointsUser()
            .resourceLogin()), //'https://localhost:44356/api/Usuario/login'
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "id": 0,
          "nombre": "",
          "apellidos": "",
          "email": email,
          "password": password
        }),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Usuario users = new Usuario.fromJson(data);
        print(users.nombre);
        print('Login successful');
      } else {
        print('Credenciales incorrectas');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class LoginUseCaseParams {
  String email;
  String password;
  LoginUseCaseParams(String email, String password);
}
