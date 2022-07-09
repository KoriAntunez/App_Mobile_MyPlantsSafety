import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hungry/views/screens/page_switcher.dart';
import 'package:hungry/views/utils/AppColor.dart';
import 'package:hungry/views/widgets/custom_text_field.dart';
import 'package:hungry/views/screens/bookmarks_page.dart';
import 'package:hungry/views/widgets/modals/register_modal.dart';
import 'package:hungry/models/core/login_model.dart';
import 'package:hungry/models/core/usuarioLogin.dart';

class LoginModal extends StatefulWidget {
  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();

  void _onFormSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      showDialog(
        context: this.context,
        builder: (context) => AlertDialog(
          title: Text('Mensaje'),
          content: Text('Form submitted'),
        ),
      );
    }
  }

  void login(String email, String password) async {
    try {
      http.Response response = await http.post(Uri.parse('https://localhost:44356/api/Usuario/login'),
          headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',},
          body: jsonEncode({"id": 0,
            "nombre": "",
            "apellidos": "",
            "email": email,
            "password": password}),);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        usuarioLogin users = new usuarioLogin.fromJson(data);
        print(users.nombre);
        print('Login successful');
      } else {
        print('filed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
              // header
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
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailCtrl,
                      title: 'Email',
                      hint: 'youremail@email.com',
                      validator: validateEmail,
                    ),
                    CustomTextField(
                        controller: passwordCtrl,
                        title: 'Password',
                        hint: '**********',
                        obsecureText: true,
                        validator: validatePassword,
                        margin: EdgeInsets.only(top: 16)),
                  ],
                ),
              ),

              // Log in Button
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    //_onFormSubmit();
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      login(emailCtrl.text.toString(),
                          passwordCtrl.text.toString());
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => PageSwitcher()));
                    }
                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BookmarksPage()));
                  },
                  child: Text('Login',
                      style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter')),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: AppColor.primarySoft,
                  ),
                ),
              ),

              // Login textbutton
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    isScrollControlled: true,
                    builder: (context) {
                      return RegisterModal();
                    },
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Aún no tienes una cuenta? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'inter',
                          ),
                          text: 'Registrarse')
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  String validateEmail(String value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    String pattern = '^.{8}';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "La contraseña es necesaria";
    } else if (!regExp.hasMatch(value)) {
      return "Ingrese una contraseña de 8 caracteres";
    } else {
      return null;
    }
  }
}
