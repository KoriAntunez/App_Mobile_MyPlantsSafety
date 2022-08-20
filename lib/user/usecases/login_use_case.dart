import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/usuario.dart';
import 'package:fluttermlprediction/user/repository/endpoints_user.dart';

class LoginUseCase {
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
        print('Login exitoso');
      } else {
        print('Credenciales incorrectas :(');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
