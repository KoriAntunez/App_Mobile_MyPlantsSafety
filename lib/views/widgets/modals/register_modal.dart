import 'package:flutter/material.dart';
import 'package:hungry/views/screens/page_switcher.dart';
import 'package:hungry/views/utils/AppColor.dart';
import 'package:hungry/views/widgets/custom_text_field.dart';
import 'package:hungry/views/widgets/modals/login_modal.dart';
<<<<<<< Updated upstream

class RegisterModal extends StatelessWidget {
=======
import 'package:hungry/models/core/register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterModal extends StatefulWidget {
  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();

  void register(String nombre, String apellidos, String email, String password) async {
    try {
      http.Response response = await http.post(Uri.parse('https://localhost:44356/api/Usuario/registro'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',},
        body: jsonEncode({"id": 0,
          "nombre": nombre,
          "apellidos": apellidos,
          "email": email,
          "password": password}),);
      if (response.statusCode == 200) {
        print("ok");
        var data = jsonDecode(response.body);
        RegisterModel users = new RegisterModel.fromJson(data);
        print(users.nombre);
        print('Registro exitoso');
      } else {
        print('filed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 35 / 100,
                  margin: EdgeInsets.only(bottom: 20),
                  height: 6,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // header
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Registrarse',
                  style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'inter'),
                ),
              ),
              // Form
              CustomTextField(title: 'Email', hint: 'youremail@email.com'),
              CustomTextField(title: 'Nombre y Apellidos', hint: 'Nombre completo', margin: EdgeInsets.only(top: 16)),
              CustomTextField(title: 'Password', hint: '**********', obsecureText: true, margin: EdgeInsets.only(top: 16)),
              CustomTextField(title: 'Repetir Password', hint: '**********', obsecureText: true, margin: EdgeInsets.only(top: 16)),
              // Register Button
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
<<<<<<< Updated upstream
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PageSwitcher()));
=======
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      register(nameCtrl.text.toString(), nameCtrl.text.toString(), emailCtrl.text.toString(), passwordCtrl.text.toString());
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
>>>>>>> Stashed changes
                  },
                  child: Text('Registrar', style: TextStyle(color: AppColor.secondary, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'inter')),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                    isScrollControlled: true,
                    builder: (context) {
                      return LoginModal();
                    },
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Tienes una cuenta creada? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'inter',
                          ),
                          text: 'Log in')
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
}
