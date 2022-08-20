import 'package:flutter/material.dart';
import 'package:fluttermlprediction/AppColor.dart';
import 'package:fluttermlprediction/user/ui/screens/login_modal.dart';
import 'package:fluttermlprediction/user/ui/widgets/custom_text_field.dart';

class RegisterModal extends StatefulWidget {
  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  final _formKey = GlobalKey<FormState>();
  // USER CONTROLLER
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();

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

              // HEADER
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Registrarse',
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
                        controller: emailCtrl,
                        title: 'Email',
                        hint: 'youremail@email.com',
                        validator: validateEmail,
                      ),
                      CustomTextField(
                          controller: nameCtrl,
                          title: 'Nombre y Apellidos',
                          hint: 'Nombre completo',
                          validator: validateName,
                          margin: EdgeInsets.only(top: 16)),
                      CustomTextField(
                          controller: passwordCtrl,
                          title: 'Password',
                          hint: '**********',
                          validator: validatePassword,
                          obsecureText: true,
                          margin: EdgeInsets.only(top: 16)),
                      CustomTextField(
                          controller: repeatPassCtrl,
                          title: 'Repetir Password',
                          hint: '**********',
                          validator: validateRepeatPassword,
                          obsecureText: true,
                          margin: EdgeInsets.only(top: 16)),
                    ],
                  )),

              // BOTON REGISTRO
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  child: Text('Registrar',
                      style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter')),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
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
                          return LoginModal();
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: AppColor.primarySoft,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // VALIDACION NOMBRES
  String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "El nombre es necesario";
    } else if (!regExp.hasMatch(value!)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  // VALIDACION EMAIL
  String? validateEmail(String? value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value!)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }

  // VALIDACION PASSWORD
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

  // VALIDACION REPETIR PASSWORD
  String? validateRepeatPassword(String? value) {
    print("Valor $value passsword ${passwordCtrl.text}");
    if (value?.length == 0) {
      return "La contraseña es necesaria";
    } else if (value != passwordCtrl.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }
}
