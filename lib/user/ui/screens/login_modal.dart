import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttermlprediction/AppColor.dart';
import 'package:fluttermlprediction/user/ui/widgets/custom_text_field.dart';
import 'package:fluttermlprediction/user/usecases/login_use_case.dart';
import 'package:http/http.dart' as http;

import '../../../ui.dart';

class LoginModal extends StatefulWidget {
  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final _formKey = GlobalKey<FormState>();
  // CONTROLADOR
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();

  // MÉTODO PARA VALIDAR EL ENVIO DEL FORMULARIO
  void _onFormSubmit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      showDialog(
        context: this.context,
        builder: (context) => AlertDialog(
          title: Text('Mensaje'),
          content: Text('Formulario enviado'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              physics: BouncingScrollPhysics(),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 35 / 100,
                    margin: EdgeInsets.only(bottom: 20),
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),

                // HEADER
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'inter'),
                  ),
                ),

                // FORMULARIO
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: emailCtrl, // email controller
                          title: 'Email',
                          hint: 'youaremail@gmail.com',
                          validator: validateEmail),
                      CustomTextField(
                        controller: passwordCtrl, // email controller
                        title: 'Password',
                        hint: '********',
                        validator: validatePassword,
                        margin: EdgeInsets.only(top: 16),
                      ),
                    ],
                  ),
                ),

                // BOTÓN LOGIN
                Container(
                  margin: EdgeInsets.only(top: 32, bottom: 6),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    child: Text('Login',
                        style: TextStyle(
                            color: AppColor.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'inter')),
                    onPressed: () {
                      // CORREGIR VALIDACIÓN
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        // INTEGRACIÓN CON EL BACKEND
                        // Validar si el usuario existe en la base de datos
                        LoginUseCase.login(emailCtrl.text.toString(),
                            passwordCtrl.text.toString());
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => UI() //PageSwitcher()
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: AppColor.primarySoft,
                    ),
                  ),
                ),

                // REDIRECCIONAMIENTO A REGISTRO
              ],
            ))
      ],
    );
  }

  // VALIDAR CORREO
  String? validateEmail(String? value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value!)) {
      return "Correo inválido";
    } else {
      return null;
    }
  }

// VALIDAR CONTRASEÑA
  String? validatePassword(String? value) {
    String pattern = '^.{8}';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "La contraseña es necesaria";
    } else if (!regExp.hasMatch(value!)) {
      return "Ingrese una contraseña de 8 caracteres";
    } else {
      return null;
    }
  }
}
