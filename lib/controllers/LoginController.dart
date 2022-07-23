import 'dart:ffi';
import 'dart:isolate';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginController {
  // Text field controllers
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();

  String email = emailCtrl.text.toString();
  String password = passwordCtrl.text.toString();
}
