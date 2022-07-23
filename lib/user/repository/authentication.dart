import 'dart:async';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:hungry/user/model/usuario.dart';

abstract class Authentication {
  Future<void> Register({
    @required String nombre,
    @required String apellidos,
    @required String email,
    @required String password,
  });

  Future<void> Aunthenticate({
    @required String email,
    @required String password,
  });
  // Devuelve si es usuario está autenticado
  Future<bool> isAuthenticated();
  // Devuelve el usuario actual autenticado
  Future<Usuario> getCurrentUser();
  // Cierra la sesión del usuario
  Future<void> logout();
}
