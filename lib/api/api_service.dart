import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/core/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    //Uri url = "https://reqres.in/api/login";

    final response = await http.post( Uri.parse('https://localhost:44356/api/Usuario/login'), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}